import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../core/services/auth.service';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-concert-list',
  standalone: true,
  imports: [CommonModule,FormsModule,RouterModule],
  templateUrl: './concert-list.component.html',
  styleUrls: ['./concert-list.component.scss']
})
export class ConcertListComponent implements OnInit {
  concerts: any[] = [];
  error = '';
  searchTerm = '';
  currentPage = 1;
  concertsPerPage = 5;

  constructor(private readonly authService: AuthService) {}

  openVideo(url: string) {
  const fullUrl = url.startsWith('http') ? url : `https://www.youtube.com/watch?v=${url}`;
  window.open(fullUrl, '_blank');
}


ngOnInit() {
  this.authService.getConcerts().subscribe({
    next: (data) => this.concerts = data,
    error: () => this.error = 'Erro ao carregar concertos.'
  });
}

get filteredConcerts() {
  const term = this.searchTerm.toLowerCase();
  return this.concerts.filter(c =>
    c.title?.toLowerCase().includes(term) ||
    c.artist?.toLowerCase().includes(term)
  );
}

get paginatedConcerts() {
  const start = (this.currentPage - 1) * this.concertsPerPage;
  const end = start + this.concertsPerPage;
  return this.filteredConcerts.slice(start, end);
}

nextPage() {
  if (this.currentPage * this.concertsPerPage < this.filteredConcerts.length) {
    this.currentPage++;
  }
}

prevPage() {
  if (this.currentPage > 1) {
    this.currentPage--;
  }
}
}
