import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { tap } from 'rxjs/operators';



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

  getConcertById(id: string) {
    const headers = this.getHeaders();
    return this.http.get<any>(`${this.apiUrl}/concerts/${id}`, { headers });
  }

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : ''
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

toggleLike(id: number) {
  return this.http.post(`${this.apiUrl}/concerts/${id}/like`, {}, {
    headers: this.getHeaders()
  });
}


getLikes(id: number | string): Observable<{ likes: number }> {
  return this.http.get<{ likes: number }>(`${this.apiUrl}/concerts/${id}/likes`);
}

toggleFavorite(id: number) {
  return this.http.post(`${this.apiUrl}/concerts/${id}/favorite`, {}, {
    headers: this.getHeaders()
  });
}

getUserLikes(): Observable<any[]> {
  return this.http.get<any[]>(`${this.apiUrl}/concerts/users/likes`, {
    headers: this.getHeaders()
  });
}

getUserFavorites(): Observable<any[]> {
  return this.http.get<any[]>(`${this.apiUrl}/concerts/users/favorites`, {
    headers: this.getHeaders()
  });
}

updateProfile(name: string, email: string) {
  return this.http.put(`${this.apiUrl}/profile`, { name, email }, {
    headers: this.getHeaders()
  });
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






}


