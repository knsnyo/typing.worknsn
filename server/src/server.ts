import express, { Express, json, urlencoded } from 'express';
import morgan from 'morgan';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import router from '@/routes/index';

const server: Express = express();

server.use(json());
server.use(urlencoded({ extended: true }));
server.use(morgan('dev'));
server.use(cors());
server.use(cookieParser());
server.use(router);

export default server;
