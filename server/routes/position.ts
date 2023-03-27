import { Router } from 'express';
import positonController from '@/controller/positionController';

const positionRouter = Router();

positionRouter.route('/positions/:level').get(positonController.level);

export default positionRouter;
