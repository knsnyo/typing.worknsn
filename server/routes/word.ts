import { Router } from 'express';
import wordController from '@/controller/wordController';

const wordRouter = Router();

wordRouter
  .route('/words')
  .get(wordController.select) //
  .post(wordController.insert);

export default wordRouter;
