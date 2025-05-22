import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, { email, password });
  }

  register(name: string, email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, { name, email, password });
  }

 private getHeaders(): HttpHeaders {
  const token = this.getToken();
  return new HttpHeaders({
    Authorization: `Bearer ${token}`
  });
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

getConcerts(): Observable<any> {
  const token = this.getToken();
  if (!token) return throwError(() => new Error("Token inválido"));

  const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });
  return this.http.get(`${this.apiUrl}/concerts/`, { headers });
}


getProfile(): Observable<any> {
  const token = this.getToken();
  const headers = new HttpHeaders({
    Authorization: `Bearer ${token}`
  });

  return this.http.get(`${this.apiUrl}/profile`, { headers });
}

logout() {
  if (typeof window !== 'undefined') {
    localStorage.removeItem('token');
  }
}

isAuthenticated(): boolean {
  return !!this.getToken();
}

getConcertById(id: string): Observable<any> {
  const token = this.getToken();
  const headers = token
    ? new HttpHeaders({ Authorization: `Bearer ${token}` })
    : undefined;

  return this.http.get(`/api/concerts/${id}`, { headers });
}

getComments(id: string | number) {
  return this.http.get<any[]>(`/api/concerts/${id}/comments`);
}

addComment(id: string | number, content: string) {
  return this.http.post(`/api/concerts/${id}/comment`, { content }, {
    headers: this.getHeaders()
  });
}

toggleLike(id: number) {
  return this.http.post(`/api/concerts/${id}/like`, {}, {
    headers: this.getHeaders()
  });
}

toggleFavorite(id: number) {
  return this.http.post(`/api/concerts/${id}/favorite`, {}, {
    headers: this.getHeaders()
  });
}

getUserLikes(): Observable<any[]> {
  return this.http.get<any[]>('/api/concerts/users/likes', { headers: this.getHeaders() });
}

getUserFavorites(): Observable<any[]> {
  return this.http.get<any[]>('/api/concerts/users/favorites', { headers: this.getHeaders() });
}

getLikes(id: number | string): Observable<{ likes: number }> {
  return this.http.get<{ likes: number }>(`${this.apiUrl}/concerts/${id}/likes`);
}

updateProfile(name: string, email: string) {
  return this.http.put('/api/profile', { name, email }, {
    headers: this.getHeaders()
  });
}

createConcert(concert: any) {
  return this.http.post('/api/concerts/', concert, { headers: this.getHeaders() });
}

updateConcert(id: number, concert: any) {
  return this.http.put(`/api/concerts/${id}`, concert, { headers: this.getHeaders() });
}

deleteConcert(id: number) {
  return this.http.delete(`/api/concerts/${id}`, { headers: this.getHeaders() });
}





}


