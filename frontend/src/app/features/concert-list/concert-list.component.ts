import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../core/services/auth.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';




@Component({
  selector: 'app-concert-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './concert-list.component.html',
  styleUrls: ['./concert-list.component.scss']
})
export class ConcertListComponent implements OnInit {
  concerts: any[] = [];
  error = '';

  currentPage = 1;
  concertsPerPage = 5;

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.authService.getConcerts().subscribe({
      next: (data) => this.concerts = data,
      error: () => this.error = 'Erro ao carregar concertos.'
    });
  }

  openVideo(videoId: string) {
    window.open(`https://www.youtube.com/watch?v=${videoId}`, '_blank');
  }

  get paginatedConcerts() {
    const start = (this.currentPage - 1) * this.concertsPerPage;
    const end = start + this.concertsPerPage;
    return this.concerts.slice(start, end);
  }

  nextPage() {
    if (this.currentPage * this.concertsPerPage < this.concerts.length) {
      this.currentPage++;
    }
  }

  prevPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
    }
  }
}
