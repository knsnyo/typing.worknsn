import { JWT_ACCESS, JWT_REFRESH } from '@/constants/constants';
import { BodyError, TokenError } from '@/utils/Error';
import { JwtPayload, sign, verify } from 'jsonwebtoken';

const tokenService = {
  validate: (token: string): void => {
    if (!token) {
      throw new TokenError(`TOKEN IS NOT FOUND`);
    }
  },
  createAccess: (idx: number, id: string): string => {
    if (!idx) {
      throw new BodyError(`IDX IS INVALID`);
    }
    if (!id) {
      throw new BodyError(`ID IS INVALID`);
    }
    return sign(
      {
        idx,
        id,
      },
      JWT_ACCESS!,
      {
        expiresIn: '5m',
      }
    );
  },
  createRefresh: (idx: number, id: string): string => {
    if (!idx) {
      throw new BodyError(`IDX IS NOT VALID`);
    }
    if (!id) {
      throw new BodyError(`ID IS NOT VALID`);
    }
    return sign(
      {
        idx,
        id,
      },
      JWT_REFRESH!,
      {
        expiresIn: '15d',
      }
    );
  },
  verifyAccess: (token: string): { idx: number; verify: boolean } => {
    try {
      const data: JwtPayload = verify(token, JWT_ACCESS!) as JwtPayload;
      return { idx: data.idx, verify: true };
    } catch (err: unknown) {
      return { idx: -1, verify: false };
    }
  },
  verifyRefresh: (token: string): JwtPayload => {
    try {
      return verify(token, JWT_REFRESH!) as JwtPayload;
    } catch (err: unknown) {
      throw new TokenError(`REFRESH TOKEN IS EXPIRE`);
    }
  },
};

export default tokenService;
