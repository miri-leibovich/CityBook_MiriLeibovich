import { Injectable } from '@angular/core';
import { User } from './user';

@Injectable({
  providedIn: 'root'
})
export class UserDataService {

  user: User
  constructor() { }

  SetUser(user: User) {
    this.user = user;
  }

  GetUser():User{
    return this.user;
  }
}
