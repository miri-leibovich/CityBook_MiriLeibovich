import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import { User } from './user';

@Injectable({
  providedIn: 'root'
})
export class AddUserService {


  constructor(private http: HttpClient) { 
    
  }

  AddUserWithChildren(user:User){
    return this.http.post("http://localhost:63216/api/AddUser/Post",user);
  }
}
