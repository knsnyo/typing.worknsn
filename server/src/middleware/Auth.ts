import tokenService from '@/services/tokenService';
import errorCatch from '@/utils/errCatch';
import { Request, Response, NextFunction } from 'express';
import { JwtPayload } from 'jsonwebtoken';

const checkAccess = (req: Request, res: Response, next: NextFunction): void => {
  const accessToken: string = req.get('accessToken') ?? '';
  const { idx, verify }: { idx: number; verify: boolean } = tokenService.verifyAccess(accessToken);
  if (verify) {
    req.body.idx = idx;
    return next('route');
  }
  return next();
};

const checkRefresh = (req: Request, res: Response, next: NextFunction): void | Response => {
  const refreshToken: string = req.get('refreshToken') ?? '';
  try {
    const data: JwtPayload = tokenService.verifyRefresh(refreshToken);
    const newAccessToken = tokenService.createAccess(data.idx, data.id);
    const newRefreshToken = tokenService.createRefresh(data.idx, data.id);
    req.body.idx = data.idx;
    req.body.accessToken = newAccessToken;
    req.body.refreshToken = newRefreshToken;
    return next();
  } catch (err: unknown) {
    return errorCatch(err, res);
  }
};

export const Auth = {
  checkAccess,
  checkRefresh,
};
