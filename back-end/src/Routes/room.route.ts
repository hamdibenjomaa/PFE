import express from 'express';
import {ControllerRoom} from '../Controllers/room.controller';


export class RoomRoutes {
 public controllersRoom : ControllerRoom = new ControllerRoom();


 public routes(app: express.Application) :void
 {
    app.post('/create/room', this.controllersRoom.createRoom);
    app.get('/getroom/:id', this.controllersRoom.getRoomById);
    app.put('/update/room/:id', this.controllersRoom.UpdateRoomById);
    app.get('/getrooms/:category', this.controllersRoom.getRoomByCategory);
    app.delete('/delete/room/:name/:category', this.controllersRoom.deleteRoom);
 }


}

