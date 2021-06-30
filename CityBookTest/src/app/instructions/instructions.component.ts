import { Component, OnInit } from '@angular/core';
import { UserDataService } from '../user-data.service';

@Component({
  selector: 'app-instructions',
  templateUrl: './instructions.component.html',
  styleUrls: ['./instructions.component.css']
})
export class InstructionsComponent implements OnInit {

  constructor(private ud: UserDataService) { }

  ngOnInit() {
    this.SetUser();
  }

  public Name = ""
  SetUser() {
    if (this.ud.GetUser() != null)
      this.Name = this.ud.GetUser().UserFirstName + " " + this.ud.GetUser().UserLastName;
  }
}
