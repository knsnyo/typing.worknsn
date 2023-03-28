import { Router } from 'express';
import shortController from '@/controllers/shortController';

const shortRouter: Router = Router();

shortRouter.route('/shorts').get(shortController.select).post(shortController.insert);

export default shortRouter;
