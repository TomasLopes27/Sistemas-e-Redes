import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './features/login/login.component';
import { ProfileComponent } from './features/profile/profile.component';
import { ConcertListComponent } from './features/concert-list/concert-list.component';
import { RegisterComponent } from './features/register/register.component';
import { DashboardComponent } from './features/dashboard/dashboard.component';
import { ConcertDetailComponent } from './features/concert-detail/concert-detail.component';
import { AuthGuard } from './core/guards/auth.guard';
import { AdminDashboardComponent } from './features/admin-dashboard/admin-dashboard.component';









export const routes: Routes = [
  {
    path: '',
    component: DashboardComponent,
    children: [
      { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
      { path: 'concerts', component: ConcertListComponent, canActivate: [AuthGuard] },
      { path: 'concerts/:id', component: ConcertDetailComponent, canActivate: [AuthGuard] },
      { path: 'admin', component: AdminDashboardComponent, canActivate: [AuthGuard] }
    ]
  },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: '**', redirectTo: 'login' }
];




@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
