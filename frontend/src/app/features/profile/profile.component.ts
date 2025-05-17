import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common'; // <--- IMPORTANTE!
import { AuthService } from '../../core/services/auth.service';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule], // <--- AQUI
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  name = '';
  email = '';
  error = '';

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.authService.getProfile().subscribe({
      next: (res) => {
        this.name = res.name;
        this.email = res.email;
      },
      error: (err) => {
        this.error = 'Erro ao carregar perfil.';
        console.error(err);
      }
    });
  }
}
