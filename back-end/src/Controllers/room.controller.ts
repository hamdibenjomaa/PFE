import { NextFunction, Request, Response } from 'express';
import dotenv from 'dotenv';
import { RoomService } from '../Services/room.service';
import IRoom from '../Interfaces/room.interface';
dotenv.config();
export class ControllerRoom {

public roomService:RoomService= new RoomService();
   
public UpdateRoomById = async (req: Request, res:Response,next:NextFunction) => 
{
    try {
    const id = req.params.id;
    const Room:IRoom = req.body;

    const Oldroom = await this.roomService.findByNameAndCategory(Room.name,Room.category);
    if(Oldroom.length!=0)
    {
        return res.status(409).send("Room Already Exist in this category.");
    }
      return await this.roomService.UpdateRoom(id,Room)
      .then((result) => {
        return res.status(201).json({
            room: result
        });
    })
    .catch((error) => {
        return res.status(500).json({
            message: error.message,
            error
        });
    });
    }
    catch(e)
    {
        next();
    }

}

public createRoom = async (req :Request , res:Response, next:NextFunction)  =>
{
    try {
        // Get user input
        const Room:IRoom = req.body;


        // validate all input 
        if( !Room.owner && !Room.date && !Room.time&& !Room.name && !Room.all_invits && !Room.category)
        {
            res.status(400).send("All input is required");
        }

        const Oldroom = await this.roomService.findByNameAndCategory(Room.name,Room.category);
        if(Oldroom.length!=0)
        {
            return res.status(409).send("Room Already Exist In This Room.");
        }

      return this.roomService.createRoom(Room)
      .then((result) => {
        return res.status(201).json({
            room: result
        });
    })
    .catch((error) => {
        return res.status(500).json({
            message: error.message,
            error
        });
    });
    }
    catch(e)
    {
        next();
    }

};

public getRoomById = async (req: Request ,res:Response,next:NextFunction) => 
{
    try {
     const id =req.params.id;
     return await this.roomService.findAllByIdOwner(id)
     .then(result => {
        return res.status(201).json({
            room: result
        });
    })
    .catch((error) => {
        return res.status(500).json({
            message: error.message,
            error
        });
    });
    }
    catch(err)
    {
        next();
    }
    
}

public getRoomByCategory = async (req: Request ,res:Response,next:NextFunction) => 
{
    try {
     const category =req.params.category;
     return await this.roomService.findAllByCategory(category)
     .then(result => {
        return res.status(201).json({
            room: result
        });
    })
    .catch((error) => {
        return res.status(500).json({
            message: error.message,
            error
        });
    });
    }
    catch(err)
    {
        next();
    }
    
}
public deleteRoom = async (req: Request ,res:Response,next:NextFunction) => 
{
try {
    const name =req.params.name ;
    const category  =req.params.category;
    const room = await this.roomService.findByNameAndCategory(name,category);
    if(room.length!=0)
    {
     return await this.roomService.deleteByNameAndCategory(name,category)
      .then((result) => {
        return  res.status(200).send({message:"room deleted"});
    })
    .catch((error) => {
        return res.status(500).json({
            message: error.message,
            error
        });
    });
     
    }
    else
    {
      res.status(401).send({message:"room not found"});
    }
  
    }catch(e)
      {
        next();
      }
    }

}