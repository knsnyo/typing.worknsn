import { Router } from 'express';
import positonController from '@/controllers/positionController';

const positionRouter: Router = Router();

positionRouter.route('/positions/:level').get(positonController.level);
positionRouter.route('/positions/:level/init').get(positonController.init);

export default positionRouter;
