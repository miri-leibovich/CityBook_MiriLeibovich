import {Child} from "./child"
export interface User{
    UserFirstName:string;
    UserLastName:string;
    UserTz:string;
    BornDate:Date;
    MaleOrFemale:string;
    HMO:string;
    Children:Child[];
};