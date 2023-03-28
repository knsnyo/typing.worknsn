import SC from '@/utils/StatusCode';
import { Request, Response, NextFunction } from 'express';

const Auth = {
  done: (req: Request, res: Response): Response => {
    return res.status(SC.OK.status).json({
      ...SC.OK,
      accessToken: req.body.accessToken,
      refreshToken: req.body.refreshToken,
    });
  },

  auto: (req: Request, res: Response, next: NextFunction): Response | void => {
    const accessToken: string = req.get('accessToken') ?? '';
    const refreshToken: string = req.get('refreshToken') ?? '';
    if ('' === accessToken) {
      return res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
    }
    if ('' === refreshToken) {
      return res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
    }
    req.body.accessToken = accessToken;
    req.body.refreshToken = refreshToken;
    next();
  },
};

export default Auth;
