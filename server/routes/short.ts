import { Router } from 'express';
import shortController from '@/controller/shortController';

const shortRouter: Router = Router();

shortRouter.route('/shorts').get(shortController.select).post(shortController.insert);

export default shortRouter;
