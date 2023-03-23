import { Router } from 'express';
import positonController from '@/controller/positionController';

const positionRouter = Router();

positionRouter.get('/:level', positonController.level);

export default positionRouter;
