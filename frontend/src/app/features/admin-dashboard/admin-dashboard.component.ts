import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../core/services/auth.service';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.scss']
})
export class AdminDashboardComponent implements OnInit {
  concerts: any[] = [];
  newConcert = this.emptyConcert();
  editMode = false;
  editingId: number | null = null;
  error = '';

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.loadConcerts();
  }

  emptyConcert() {
    return {
      title: '',
      url: '',
      artist: '',
      genre: '',
      release_date: '',
      image_url: ''
    };
  }

  loadConcerts() {
    this.authService.getConcerts().subscribe({
      next: res => this.concerts = res,
      error: () => this.error = 'Erro ao carregar concertos.'
    });
  }

  saveConcert() {
    if (this.editMode && this.editingId !== null) {
      this.authService.updateConcert(this.editingId, this.newConcert).subscribe({
        next: () => {
          this.resetForm();
          this.loadConcerts();
        },
        error: () => this.error = 'Erro ao editar concerto.'
      });
    } else {
      this.authService.createConcert(this.newConcert).subscribe({
        next: () => {
          this.resetForm();
          this.loadConcerts();
        },
        error: () => this.error = 'Erro ao criar concerto.'
      });
    }
  }

  editConcert(c: any) {
    this.newConcert = { ...c };
    this.editingId = c.id;
    this.editMode = true;
  }

  deleteConcert(id: number) {
    if (confirm('Tens a certeza que queres apagar este concerto?')) {
      this.authService.deleteConcert(id).subscribe({
        next: () => this.loadConcerts(),
        error: () => this.error = 'Erro ao apagar concerto.'
      });
    }
  }

  resetForm() {
    this.newConcert = this.emptyConcert();
    this.editMode = false;
    this.editingId = null;
  }
}
