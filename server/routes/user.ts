import { Router } from 'express';
import userController from '@/controller/userController';
import Token from '@/middleware/token';
import Auth from '@/middleware/auth';
import recordController from '@/controller/recordController';

const userRouter: Router = Router();

userRouter
  .route('/signin') //
  .get(Auth.auto, Token.createAccess, Token.createRefresh, Auth.done)
  .post(userController.signin, Token.createAccess, Token.createRefresh, Auth.done);
userRouter
  .route('/signup') //
  .post(userController.signup);

userRouter
  .route('') //
  .get(Token.verifyAccess, Token.verifyRefresh, Token.createAccess, Token.verifyAccess)
  .post(Token.verifyAccess, Token.verifyRefresh, Token.createAccess, Token.verifyAccess);

userRouter.route('').get(recordController.getInfo).post(recordController.insert);

export default userRouter;
