import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { AuthService } from '../../core/services/auth.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { ReportDialogComponent } from '../dialogs/report-dialog/report-dialog.component';

@Component({
  selector: 'app-concert-detail',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './concert-detail.component.html',
  styleUrls: ['./concert-detail.component.scss']
})
export class ConcertDetailComponent implements OnInit {
  concert: any;
  safeUrl!: SafeResourceUrl;
  error = '';
  comments: any[] = [];
  newComment = '';
  liked = false;
  favorited = false;
  reported = false;
  likeCount = 0;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private sanitizer: DomSanitizer,
    private authService: AuthService,
    private dialog: MatDialog
  ) {}

  ngOnInit() {
  const id = this.route.snapshot.paramMap.get('id');
  if (!id) {
    console.error('❌ ID de concerto ausente da rota');
    return;
  }

  console.log('🔍 ID recebido:', id);

  this.authService.getConcertById(id).subscribe({
    next: (data) => {
      console.log('🎶 Concerto recebido do backend:', data); 

      this.concert = data;
      const videoId = this.extractVideoId(this.concert.url);
      this.safeUrl = this.sanitizer.bypassSecurityTrustResourceUrl(
        `https://www.youtube.com/embed/${videoId}`
      );

      // Comentários
      this.authService.getComments(id).subscribe((res) => this.comments = res);

      // Total de likes
      this.authService.getLikes(id).subscribe({
        next: (res) => this.likeCount = res.likes,
        error: () => this.likeCount = 0
      });

      // Likes e favoritos
      this.authService.getUserLikes().subscribe({
        next: (likes) => {
          this.liked = likes.some(c => c.id === this.concert.id);
        },
        error: () => {
          this.liked = false;
        }
      });

      this.authService.getUserFavorites().subscribe({
        next: (favs) => {
          this.favorited = favs.some(c => c.id === this.concert.id);
        },
        error: () => {
          this.favorited = false;
        }
      });

    },
    error: (err) => {
      console.error('❌ Erro ao carregar concerto:', err);
      this.error = 'Erro ao carregar concerto.';
    }
  });
}



  extractVideoId(url: string): string {
    if (url.startsWith('http')) {
      const match = url.match(/v=([^&]+)/);
      return match ? match[1] : '';
    }
    return url;
  }

  enviarComentario() {
    const id = this.concert.id;
    this.authService.addComment(id, this.newComment).subscribe({
      next: () => {
        this.comments.unshift({
          user: 'Tu', content: this.newComment, timestamp: new Date().toISOString()
        });
        this.newComment = '';
      },
      error: () => this.error = 'Erro ao enviar comentário.'
    });
  }

  toggleLike() {
    this.authService.toggleLike(this.concert.id).subscribe({
      next: () => {
        this.liked = !this.liked;
        this.likeCount += this.liked ? 1 : -1;
      }
    });
  }


  toggleFavorite() {
    this.authService.toggleFavorite(this.concert.id).subscribe({
      next: () => this.favorited = !this.favorited
    });
  }

  toggleReport() {
    const dialogRef = this.dialog.open(ReportDialogComponent, {
      width: '400px',
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        console.log('Report enviado:', result);
        // Exemplo:
        // this.api.sendReport(result).subscribe(...)
      }
    });
  }
}
