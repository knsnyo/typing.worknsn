import 'dotenv/config';
import { Request, Response, NextFunction } from 'express';
import { JwtPayload, sign, verify } from 'jsonwebtoken';
import SC from '@/utils/StatusCode';

const Token = {
  createAccess: (req: Request, res: Response, next: NextFunction) => {
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

  createRefresh: (req: Request, res: Response, next: NextFunction) => {
    req.body.refreshToken = sign(
      {
        idx: req.body.idx,
        id: req.body.id,
      },
      process.env.JWT_REFRESH!,
      {
        expiresIn: '15d',
      }
    );
    next();
  },

  verifyAccess: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const token = req.body.accessToken ?? req.get('accessToken');
      const data = verify(token, process.env.JWT_ACCESS!) as JwtPayload;
      req.body.idx = data.idx;
      next('route');
    } catch (err) {
      next();
    }
  },

  verifyRefresh: async (req: Request, res: Response, next: NextFunction) => {
    const token = req.get('refreshToken')!;
    try {
      const data = verify(token, process.env.JWT_REFRESH!);
      next();
    } catch (err) {
      res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
    }
  },
};

export default Token;
