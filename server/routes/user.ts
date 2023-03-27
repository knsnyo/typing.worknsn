import { Router } from 'express';
import userController from '@/controller/userController';
import Token from '@/middleware/token';
import Auth from '@/middleware/auth';
import recordController from '@/controller/recordController';

const userRouter = Router();

userRouter
  .route('/signin')
  .post(
    userController.signin,
    Token.createAccess,
    Token.createRefresh,
    Auth.done
  );
userRouter.route('/signup').post(userController.signup);
userRouter
  .route('/:idx') // user index
  .get(recordController.getInfo)
  .post(recordController.insert);

export default userRouter;
