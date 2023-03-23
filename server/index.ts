import 'dotenv/config';
import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import userRouter from '@/routes/user';
import positionRouter from '@/routes/position';
import wordRouter from '@/routes/word';
import shortRouter from '@/routes/short';

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan('dev'));
app.use(cors());
app.use(cookieParser());

app.use('/users', userRouter);
app.use('/positions', positionRouter);
app.use('/words', wordRouter);
app.use('/shorts', shortRouter);

app.listen(parseInt(process.env.SERVER_PORT!), process.env.SERVER_URL!, () => {
  console.log(
    `Server Running on http://${process.env.SERVER_URL}:${process.env.SERVER_PORT}`
  );
});
