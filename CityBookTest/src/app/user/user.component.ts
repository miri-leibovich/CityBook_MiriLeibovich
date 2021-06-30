import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormArray, FormControl, RequiredValidator, Validators } from '@angular/forms';
import { AddUserService } from '../add-user.service';
import { Child } from '../child';
import { User } from '../user';
import { UserDataService } from '../user-data.service';

@Component({
  selector: 'user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  constructor(private fb: FormBuilder, private http: AddUserService, private ud: UserDataService,) { }


  userForm: FormGroup;
  messege = "";

  ngOnInit() {
    this.userForm = this.fb.group({
      UserFirstName: this.ud.GetUser() ? [this.ud.user.UserFirstName, Validators.required] : ['', Validators.required],
      UserLastName: this.ud.GetUser() ? this.ud.user.UserLastName : ['', Validators.required],
      UserTz: this.ud.GetUser() ? this.ud.user.UserTz : ['', Validators.required],
      BornDate: this.ud.GetUser() ? this.ud.user.BornDate : [new Date(), Validators.required],
      MaleOrFemale: this.ud.GetUser() ? this.ud.user.MaleOrFemale : ['', Validators.required],
      HMO: this.ud.GetUser() ? this.ud.user.HMO : ['', Validators.required],
      Children:
        this.fb.array([this.fb.group({
          ChildName: ['', Validators.required],
          ChildTz: ['', Validators.pattern("[0-9]+")],
          ChildBornDate: [new Date(), Validators.required]
        })], Validators.required)
    })
    if (this.ud.GetUser()) {
      this.newChild.removeAt(0);
      this.ud.user.Children.map(c => {
        this.newChild.push(this.fb.group({
          ChildName: c.ChildName,
          ChildTz: c.ChildTz,
          ChildBornDate: c.ChildBornDate
        }))
      })
    }
  }


  get newChild() {
    return this.userForm.get('Children') as FormArray;
  }

  addChild() {
    this.newChild.push(this.fb.group({
      ChildName: '',
      ChildTz: '',
      ChildBornDate: new Date()
    }));
  }

  DeleteChild(index) {
    this.newChild.removeAt(index);
  }

  AddUser(user: User) {
    this.messege=""
    if (user.UserFirstName == "") {
      this.messege += "Enter first name"
    }

    if (user.UserLastName == "") {
      this.messege += "Enter last name"
    }

    if (!this.is_israeli_id_number(user.UserTz)) {
      this.messege += "Incorrect ID number";
    }

    if (user.BornDate == null) {
      this.messege += "Enter Date of birth"
    }

    if (user.BornDate == null) {
      this.messege += "Enter Date of birth"
    }

    if (user.HMO == "") {
      this.messege += "Enter HMO"
    }
    if (this.messege != "") {
      alert(this.messege);
    }
    else this.http.AddUserWithChildren(user).subscribe((x: any) => {
      console.log(x);
    });

  }
  SaveUser(user: User) {
    this.ud.SetUser(user);
  }

  is_israeli_id_number(id) {
    id = String(id).trim();
    if (id.length > 9 || isNaN(id)) return false;
    id = id.length < 9 ? ("00000000" + id).slice(-9) : id;
    return Array.from(id, Number).reduce((counter, digit, i) => {
      const step = digit * ((i % 2) + 1);
      return counter + (step > 9 ? step - 9 : step);
    }) % 10 === 0;
  }
}
