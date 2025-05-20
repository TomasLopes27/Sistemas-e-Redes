import { Component } from '@angular/core';
import { Router,RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { AuthService } from '../../core/services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    HttpClientModule,
    RouterModule
  ],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  email = '';
  password = '';
  error = '';

  constructor(private authService: AuthService, private router: Router) {}

  login() {
  this.authService.login(this.email, this.password).subscribe({
    next: (res) => {
      this.authService.saveToken(res.token);
      
      // Força a atualização do token em memória antes de ir para o concerto
      setTimeout(() => {
        this.router.navigate(['/concerts']);
      }, 0); // pequeno delay para garantir que o localStorage está escrito
    },
    error: (err) => {
      this.error = err.error?.error || 'Erro ao fazer login.';
    }
  });
}

}
