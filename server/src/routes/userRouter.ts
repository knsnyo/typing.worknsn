import { Router } from 'express';
import userController from '@/controllers/userController';
import Token from '@/middleware/token';
import Auth from '@/middleware/auth';

const userRouter: Router = Router();

userRouter
  .route('/users/signin') //
  .get(Auth.auto, Token.verifyRefresh, Token.createAccess, Token.createRefresh, Auth.done)
  .post(userController.signin, Token.createAccess, Token.createRefresh, Auth.done);
userRouter
  .route('/users/signup') //
  .post(userController.signup);

export default userRouter;
