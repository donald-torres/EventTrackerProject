import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { Program } from '../models/program';
import { Observable, catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProgramService {

  private url = environment.baseURL + 'api/programs';

  constructor(private http: HttpClient) { }

  index(): Observable<Program[]> {
    return this.http.get<Program[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('ProgramService.index(): error retrieving Program: ' + err)
          );
        })
        );
      }

      create(program: Program): Observable<Program> {
        program.category.id = 22;
        return this.http.post<Program>(this.url, program).pipe(
          catchError((err: any) => {
            console.log(err);
            return throwError(
              () => new Error('ProgramService.create(): error creating Program: ' + err)
            );
          })
        );
      }
      update(program: Program): Observable<Program> {
        return this.http.put<Program>(this.url +'/'+ program.id, program);
      
      }
      destroy(id: number): Observable<void> {
        return this.http.delete<void>(this.url +'/'+ id);
      }
}
