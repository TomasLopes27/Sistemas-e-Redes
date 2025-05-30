import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';
import { Component, OnInit } from '@angular/core';

import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../dialogs/confirm-dialog/confirm-dialog.component';

@Component({
  standalone: true,
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
  imports: [CommonModule, RouterModule]
})


export class DashboardComponent implements OnInit {
  isAdmin = false;

  constructor(
    public authService: AuthService, 
    private router: Router,
    private dialog: MatDialog
  ) {}

  ngOnInit() {
    
    const token = this.authService.getToken();
    if (token) {
      const payload = JSON.parse(atob(token.split('.')[1]));
      console.log(payload)
      this.isAdmin = payload.usertype === 0;
    }
  }

  logout() {
    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      width: '400px',
      disableClose: true,  // opcional: não permite fechar clicando fora
      autoFocus: false     // opcional: evita foco automático
    });

    dialogRef.afterClosed().subscribe(confirmed => {
      if (confirmed) {
        this.authService.logout();
        this.router.navigate(['/login']);
      }
    });
  }

}
