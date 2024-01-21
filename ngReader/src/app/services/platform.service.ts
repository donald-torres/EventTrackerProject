import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from '../../environments/environment';
import { Program as Platform } from '../models/program';

@Injectable({
  providedIn: 'root',
})
export class PlatformService {
  private url = environment.baseURL + 'api/platforms';

  constructor(private http: HttpClient) {}

  index(): Observable<Platform[]> {
    return this.http.get<Platform[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error(
              'PlatformService.index(): error retrieving Platforms: ' + err
            )
        );
      })
    );
  }

  create(platform: Platform): Observable<Platform> {
    return this.http.post<Platform>(this.url, platform).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error(
              'PlatformService.create(): error creating Platforms: ' + err
            )
        );
      })
    );
  }
  update(platform: Platform): Observable<Platform> {
    return this.http.put<Platform>(this.url + '/' + platform.id, platform);
  }
  destroy(id: number): Observable<void> {
    return this.http.delete<void>(this.url + '/' + id);
  }
}
