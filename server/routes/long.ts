import { Router } from 'express';
import longController from '@/controller/longController';

const longRouter = Router();

longRouter
  .route('/')
  .get(longController.select) //
  .post(longController.insert);

export default longRouter;
