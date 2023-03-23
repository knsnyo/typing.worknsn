import { Router } from 'express';
import wordController from '@/controller/wordController';

const wordRouter = Router();

wordRouter
  .route('/')
  .get(wordController.select) //
  .post(wordController.insert);

export default wordRouter;
