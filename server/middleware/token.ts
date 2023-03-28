import 'dotenv/config';
import { Request, Response, NextFunction } from 'express';
import { JwtPayload, sign, verify } from 'jsonwebtoken';
import SC from '@/utils/StatusCode';

const Token = {
  createAccess: (req: Request, res: Response, next: NextFunction): void => {
    req.body.accessToken = sign(
      {
        idx: req.body.idx,
        id: req.body.id,
      },
      process.env.JWT_ACCESS!,
      {
        expiresIn: '1m',
      }
    );
    next();
    console.log(`=================`);
    console.log('create access');
    console.log(req.body);
    console.log(`=================`);
  },

  createRefresh: (req: Request, res: Response, next: NextFunction): void => {
    const { accessToken, ...others } = req.body;
    req.body.refreshToken = sign(others, process.env.JWT_REFRESH!, {
      expiresIn: '15d',
    });
    next();
    console.log('create refresh');
  },

  verifyAccess: (req: Request, res: Response, next: NextFunction): void => {
    const token: string = req.body.accessToken ?? req.get('accessToken');
    console.log(`=================`);
    console.log(req.body.accessToken);
    console.log(req.get('accessToken'));
    console.log(token);
    console.log(`=================`);
    try {
      const data: JwtPayload = verify(token, process.env.JWT_ACCESS!) as JwtPayload;
      req.body.idx = data.idx;
      next('route');
    } catch (err) {
      console.log('access token expired');
      next();
    }
  },

  verifyRefresh: (req: Request, res: Response, next: NextFunction): Response | void => {
    console.log('verify refresh');
    const token: string = req.get('refreshToken')!;
    try {
      const data: JwtPayload | string = verify(token, process.env.JWT_REFRESH!);
      console.log(data);
      req.body = { ...req.body };
      console.log(`=================`);
      console.log(req.body);
      console.log(`=================`);
      next();
    } catch (err) {
      console.log('refresh token expired');
      return res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
    }
  },
};

export default Token;
