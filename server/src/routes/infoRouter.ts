import chulseokController from '@/controllers/chulseokController';
import recordController from '@/controllers/recordController';
import { Auth } from '@/middleware/Auth';
import { Router } from 'express';

const infoRouter: Router = Router();

infoRouter.route('*').all(Auth.checkAccess, Auth.checkRefresh);
infoRouter.route('/info/records').get(recordController.getInfo).post(recordController.insert);
infoRouter.route('/info/chulseoks').get(chulseokController.getList);
// infoRouter.route('/avg-max').get();

export default infoRouter;
