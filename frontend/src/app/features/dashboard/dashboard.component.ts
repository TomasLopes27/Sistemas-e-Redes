import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';
import { Component, OnInit } from '@angular/core';


@Component({
  standalone: true,
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
  imports: [CommonModule, RouterModule]
})


export class DashboardComponent implements OnInit {
  isAdmin = false;

  constructor(public authService: AuthService, private router: Router) {}

  ngOnInit() {
    
    const token = this.authService.getToken();
    if (token) {
      const payload = JSON.parse(atob(token.split('.')[1]));
      console.log(payload)
      this.isAdmin = payload.usertype === 0;
    }
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/login']);
  }


}
