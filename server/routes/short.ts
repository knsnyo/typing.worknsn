import { Router } from 'express';
import shortController from '@/controller/shortController';

const shortRouter = Router();

shortRouter
  .route('/')
  .get(shortController.select) //
  .post(shortController.insert);

export default shortRouter;
