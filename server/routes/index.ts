import { Router } from 'express';
import userRouter from '@/routes/user';
import positionRouter from '@/routes/position';
import wordRouter from '@/routes/word';
import shortRouter from '@/routes/short';

const router: Router = Router();

router.use(positionRouter);
router.use(wordRouter);
router.use(shortRouter);
router.use('/users', userRouter);

export default router;
