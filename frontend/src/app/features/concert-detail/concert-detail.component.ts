import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { AuthService } from '../../core/services/auth.service';
import { HttpClientModule } from '@angular/common/http';

@Component({
  standalone: true,
  selector: 'app-concert-detail',
  templateUrl: './concert-detail.component.html',
  styleUrls: ['./concert-detail.component.scss'],
  imports: [CommonModule, RouterModule, HttpClientModule] // ✅ aqui está o segredo
})
export class ConcertDetailComponent implements OnInit {
  concert: any = null; // ✅ isto estava a faltar
  safeUrl: SafeResourceUrl | null = null;
  error = '';

  constructor(
    private route: ActivatedRoute,
    private authService: AuthService,
    private sanitizer: DomSanitizer
  ) {}

extractVideoId(url: string): string {
  try {
    const parsed = new URL(url);
    return parsed.searchParams.get('v') || url;
  } catch {
    return url; // fallback: assume que já é o ID
  }
}

ngOnInit() {
  const id = this.route.snapshot.paramMap.get('id');
  if (!id) return;

  this.authService.getConcertById(id).subscribe({
    next: (data) => {
      this.concert = data;

      const videoId = this.extractVideoId(this.concert.url);
      console.log("URL recebido:", this.concert.url);  // 👈 vê se é tipo 'MQBuO2yWsFQ'

      this.safeUrl = this.sanitizer.bypassSecurityTrustResourceUrl(
        `https://www.youtube.com/embed/${videoId}`
      );
    },
    error: (err) => {
      this.error = 'Erro ao carregar concerto.';
      console.error(err);
    }
  });
}

}
