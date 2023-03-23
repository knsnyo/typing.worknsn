import { Router } from 'express';
import userController from '@/controller/userController';
import Token from '@/middleware/token';
import Auth from '@/middleware/auth';

const userRouter = Router();

userRouter.post(
  '/signin',
  userController.signin,
  Token.createAccess,
  Token.createRefresh,
  Auth.done
);
userRouter.post('/signup', userController.signup);

export default userRouter;
