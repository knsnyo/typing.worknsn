import chulseokController from '@/controllers/chulseokController';
import recordController from '@/controllers/recordController';
import Auth from '@/middleware/Auth';
import { Router } from 'express';

const infoRouter: Router = Router();

infoRouter.use(Auth);
infoRouter.route('/info/records').get(recordController.getInfo).post(recordController.insert);
infoRouter.route('/info/chulseoks').get(chulseokController.getList);
// infoRouter.route('/min-max').get();

export default infoRouter;
