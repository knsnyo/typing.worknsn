import chulseokController from '@/controllers/chulseokController';
import recordController from '@/controllers/recordController';
import Token from '@/middleware/token';
import { Router } from 'express';

const infoRouter: Router = Router();

infoRouter.use(Token.verifyAccess, Token.verifyRefresh, Token.createAccess, Token.verifyAccess);
infoRouter.route('/info/records').get(recordController.getInfo).post(recordController.insert);
infoRouter.route('/info/chulseoks').get(chulseokController.getList);
// infoRouter.route('/min-max').get();

export default infoRouter;
