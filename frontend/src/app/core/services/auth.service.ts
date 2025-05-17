import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
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
    let headers = new HttpHeaders();

    if (token) {
      headers = headers.set('Authorization', `Bearer ${token}`);
    }

    return this.http.get('/api/concerts', { headers });
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

}


