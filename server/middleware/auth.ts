import SC from '@/utils/StatusCode';
import { Request, Response, NextFunction } from 'express';

const Auth = {
  done: (req: Request, res: Response) => {
    res.status(SC.OK.status).json({
      ...SC.OK,
      accessToken: req.body.accessToken,
      refreshToken: req.body.refreshToken,
    });
  },

  auto: (req: Request, res: Response, next: NextFunction) => {
    const refreshToken = req.get('refreshToken');
  },
};

export default Auth;
