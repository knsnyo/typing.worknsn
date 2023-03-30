import tokenService from '@/services/tokenService';
import { Request, Response, NextFunction } from 'express';
import { JwtPayload } from 'jsonwebtoken';

const Auth = (req: Request, res: Response, next: NextFunction): void => {
  const accessToken: string = req.body.accessToken ?? req.get('accessToken');
  const refreshToken: string = req.body.refreshToken ?? req.get('refreshToken');
  const { idx, verify }: { idx: number; verify: boolean } = tokenService.verifyAccess(accessToken);
  if (verify) {
    req.body.idx = idx;
    return next();
  }
  const data: JwtPayload = tokenService.verifyRefresh(refreshToken);
  const newAccessToken = tokenService.createAccess(data.idx, data.id);
  const newRefreshToken = tokenService.createRefresh(data.idx, data.id);
  req.body.idx = data.idx;
  req.body.accessToken = newAccessToken;
  req.body.refreshToken = newRefreshToken;
  return next();
};

export default Auth;
