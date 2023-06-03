import { Document } from 'mongoose';
import IUser from './user';

export default interface IRoom extends Document {
   _id: string;
   owner : IUser;
   date : Date;
   time :string; 
   name: string;
   all_invits : Array<IUser>;
   category : string;
   code:string;
}