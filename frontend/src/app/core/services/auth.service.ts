import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { HttpHeaders } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = '/api';

  constructor(private http: HttpClient) {}

  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, { email, password });
  }

  register(name: string, email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, { name, email, password });
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


}


