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
  },

  createRefresh: (req: Request, res: Response, next: NextFunction): void => {
    const { accessToken, ...others } = req.body;
    req.body.refreshToken = sign(others, process.env.JWT_REFRESH!, {
      expiresIn: '15d',
    });
    next();
  },

  verifyAccess: (req: Request, res: Response, next: NextFunction): void => {
    const token: string = req.body.accessToken ?? req.get('accessToken');
    try {
      const data: JwtPayload = verify(token, process.env.JWT_ACCESS!) as JwtPayload;
      req.body.idx = data.idx;
      next('route');
    } catch (err) {
      next();
    }
  },

  verifyRefresh: (req: Request, res: Response, next: NextFunction): Response | void => {
    const token: string = req.get('refreshToken')!;
    try {
      const data: JwtPayload = verify(token, process.env.JWT_REFRESH!) as JwtPayload;
      req.body = { ...req.body, idx: data.idx };
      next();
    } catch (err) {
      return res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
    }
  },
};

export default Token;
