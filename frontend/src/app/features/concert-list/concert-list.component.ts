import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../core/services/auth.service';

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

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.authService.getConcerts().subscribe({
      next: (data) => this.concerts = data,
      error: () => this.error = 'Erro ao carregar concertos.'
    });
  }
}
