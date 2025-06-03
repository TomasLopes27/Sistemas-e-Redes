import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../core/services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  name = '';
  email = '';
  error = '';
  editMode = false;

  likedConcerts: any[] = [];
  favoriteConcerts: any[] = [];

  constructor(private readonly authService: AuthService, private readonly router: Router) {}

  ngOnInit() {
    this.loadProfileData();
  }

  loadProfileData() {
    this.authService.getProfile().subscribe({
      next: (res) => {
        this.name = res.name;
        this.email = res.email;
      },
      error: (err) => {
        this.error = 'Erro ao carregar perfil.';
        if (err.status === 401) {
          this.authService.logout();
          this.router.navigate(['/login']);
        }
      }
    });

    this.authService.getUserLikes().subscribe({
      next: (res) => this.likedConcerts = res,
      error: () => this.error = 'Erro ao carregar likes.'
    });

    this.authService.getUserFavorites().subscribe({
      next: (res) => this.favoriteConcerts = res,
      error: () => this.error = 'Erro ao carregar favoritos.'
    });
  }

  saveChanges() {
    this.authService.updateProfile(this.name, this.email).subscribe({
      next: () => {
        this.editMode = false;
        alert('Perfil atualizado com sucesso!');
        this.loadProfileData();
      },
      error: () => {
        this.error = 'Erro ao atualizar perfil.';
      }
    });
  }
}
