import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { tap } from 'rxjs/operators';
import { log } from 'node:console';



@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  //#region Login
  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, { email, password });
  }

  saveToken(token: string) {
    localStorage.setItem('token', token);
  }

  getToken(): string | null {
    if (typeof window !== 'undefined') {
      return localStorage.getItem('token');
    }
    return null;
  }

  logout() {
    if (typeof window !== 'undefined') {
      localStorage.removeItem('token');
    }
  }

  isAuthenticated(): boolean {
    return !!this.getToken();
  }
  //#endregion

  //#region Register
  register(name: string, email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, { name, email, password });
  }
  //#endregion

  

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : ''
    });
  }

  //#region Profile
  getProfile(): Observable<any> {
    const token = this.getToken();
    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`
    });

    return this.http.get(`${this.apiUrl}/profile`, { headers });
  }

  updateProfile(name: string, email: string) {
    return this.http.put(`${this.apiUrl}/profile`, { name, email }, {
      headers: this.getHeaders()
    });
  }
  //#endregion

  //#region Concerts
  getConcerts(): Observable<any> {
    const token = this.getToken();
    if (!token) return throwError(() => new Error("Token inválido"));

    const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });
    return this.http.get(`${this.apiUrl}/concerts/`, { headers });
  }

  getConcertById(id: string) {
    const headers = this.getHeaders();
    return this.http.get<any>(`${this.apiUrl}/concerts/${id}`, { headers });
  }

  createConcert(concert: any) {
    return this.http.post(`${this.apiUrl}/concerts/`, concert, {
      headers: this.getHeaders()
    });
  }

  updateConcert(id: number, concert: any) {
    return this.http.put(`${this.apiUrl}/concerts/${id}`, concert, {
      headers: this.getHeaders()
    });
  }

  deleteConcert(id: number) {
    return this.http.delete(`${this.apiUrl}/concerts/${id}`, {
      headers: this.getHeaders()
    });
  }
  //#endregion

  //#region Comments
  getComments(id: string | number) {
    return this.http.get<any[]>(`${this.apiUrl}/concerts/${id}/comments`, {
      headers: this.getHeaders()
    });
  }

  addComment(id: string | number, content: string) {
    return this.http.post(`${this.apiUrl}/concerts/${id}/comment`, { content }, {
      headers: this.getHeaders()
    });
  }

  updateComment(id: string | number, content: string) {
    // return this.http.post(`${this.apiUrl}/concerts/${id}/comment`, { content }, {
    //   headers: this.getHeaders()
    // });
  }
  //#endregion

  //#region Likes
  getLikes(id: number | string): Observable<{ likes: number }> {
    return this.http.get<{ likes: number }>(`${this.apiUrl}/concerts/${id}/likes`);
  }

  getUserLikes(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/concerts/users/likes`, {
      headers: this.getHeaders()
    });
  }

  toggleLike(id: number) {
    return this.http.post(`${this.apiUrl}/concerts/${id}/like`, {}, {
      headers: this.getHeaders()
    });
  }
  //#endregion

  //#region Favorites
  getUserFavorites(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/concerts/users/favorites`, {
      headers: this.getHeaders()
    });
  }

  toggleFavorite(id: number) {
    return this.http.post(`${this.apiUrl}/concerts/${id}/favorite`, {}, {
      headers: this.getHeaders()
    });
  }
  //#endregion

  //#region Reports
  
  //#endregion
}


