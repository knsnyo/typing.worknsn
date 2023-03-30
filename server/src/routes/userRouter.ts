import { Router } from 'express';
import userController from '@/controllers/userController';

const userRouter: Router = Router();

userRouter
  .route('/users/signin') //
  .get(userController.auto)
  .post(userController.signin);
userRouter
  .route('/users/signup') //
  .post(userController.signup);

export default userRouter;
