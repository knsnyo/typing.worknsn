import 'dotenv/config';
import express, { Express } from 'express';
import morgan from 'morgan';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import router from '@/routes';

const app: Express = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan('dev'));
app.use(cors());
app.use(cookieParser());
app.use(router);

app.listen(parseInt(process.env.SERVER_PORT!), process.env.SERVER_URL!);
