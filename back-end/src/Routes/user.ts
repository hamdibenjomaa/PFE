import express from 'express';
import {ControllerUser} from '../Controllers/user.controller';
import { auth } from '../middleware/auth';

export  class UserRoutes 
{
    
    public controllerUser: ControllerUser = new ControllerUser();
    public auth : auth = new auth();
    public routes(app:express.Application): void  {
        app.post('/create/user', this.controllerUser.createUser);  
        app.post('/login/user',this.controllerUser.loginUser);
        app.post("/welcome", this.auth.verifyToken, (req, res) => {
            res.status(200).send("Welcome 🙌 ");
          });
        app.get('/get/userbyid/:id', this.controllerUser.getUserById);
        app.put('/user/update/:id', this.controllerUser.updatePassword);
    }

}
