import { Router } from 'express';
import userRouter from '@/routes/userRouter';
import positionRouter from '@/routes/positionRouter';
import wordRouter from '@/routes/wordRouter';
import shortRouter from '@/routes/shortRouter';

const router: Router = Router();

router.use(positionRouter);
router.use(wordRouter);
router.use(shortRouter);
router.use('/users', userRouter);

export default router;
