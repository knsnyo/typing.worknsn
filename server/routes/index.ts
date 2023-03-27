import { Router } from 'express';
import userRouter from '@/routes/user';
import positionRouter from '@/routes/position';
import wordRouter from '@/routes/word';
import shortRouter from '@/routes/short';

const router = Router();

router.use('/users', userRouter);
router.use(positionRouter);
router.use(wordRouter);
router.use(shortRouter);

export default router;
