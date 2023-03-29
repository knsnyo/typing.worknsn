import { Router } from 'express';
import userRouter from '@/routes/userRouter';
import positionRouter from '@/routes/positionRouter';
import wordRouter from '@/routes/wordRouter';
import shortRouter from '@/routes/shortRouter';
import infoRouter from '@/routes/infoRouter';

const router: Router = Router();

router.use(positionRouter);
router.use(wordRouter);
router.use(shortRouter);
router.use(userRouter);
router.use(infoRouter);

export default router;
