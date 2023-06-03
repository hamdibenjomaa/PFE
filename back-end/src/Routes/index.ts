import {Application, Request, Response } from 'express';
import {UserRoutes} from './user';
import {RoomRoutes} from './room.route';

export class Routes {
    public  user:UserRoutes = new UserRoutes();
    public  room:RoomRoutes = new RoomRoutes();
    public routes(app:Application): void {
        console.log("routes here")
        app.route('/')
        .get((req: Request, res: Response) => {
            res.status(200).send({
                message: "Welcome to the awesome api.. :)!!"
            });
        });
        this.room.routes(app);
        this.user.routes(app);
            
}

}