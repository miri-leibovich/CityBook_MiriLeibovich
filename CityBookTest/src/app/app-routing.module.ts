import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { InstructionsComponent } from './instructions/instructions.component';
import { UserComponent } from './user/user.component';


const routes: Routes = [
  {path:'',redirectTo:'/instructions',pathMatch:'full'},
  { path: 'instructions', component: InstructionsComponent },
  { path: 'user', component: UserComponent ,data: {
    reuseRoute: true
  } },
];


@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
