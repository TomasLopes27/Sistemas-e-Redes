import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../core/services/auth.service';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [],
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
