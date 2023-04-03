import { Request, Response } from 'express';
import StatusCode from '@/utils/StatusCode';
import { IUser } from '@/types/types';
import userService from '@/services/userService';
import errorCatch from '@/utils/errJson';
import tokenService from '@/services/tokenService';
import { JwtPayload } from 'jsonwebtoken';

const userController = {
  signup: async (req: Request, res: Response): Promise<Response> => {
    const { id, password }: IUser = req.body;
    try {
      await userService.checkDuplicatdId(id);
      await userService.signup({ id, password });
      return res.status(StatusCode.CREATED.status).json(StatusCode.CREATED);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  signin: async (req: Request, res: Response): Promise<Response> => {
    const { id, password }: IUser = req.body;
    try {
      const find: IUser = await userService.findUserById(id);
      await userService.checkPassword(password, find.password);
      const newAccessToken: string = tokenService.createAccess(find.idx!, find.id);
      const newRefreshToken: string = tokenService.createRefresh(find.idx!, find.id);
      return res.status(StatusCode.OK.status).json({
        ...StatusCode.OK,
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      });
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  auto: async (req: Request, res: Response): Promise<Response> => {
    const refreshToken: string = req.get('refreshToken') ?? '';
    try {
      tokenService.validate(refreshToken);
      const { idx, id }: JwtPayload = tokenService.verifyRefresh(refreshToken);
      await userService.findUserById(id);
      const newAccessToken: string = tokenService.createAccess(idx, id);
      const newRefreshToken: string = tokenService.createRefresh(idx, id);
      return res.status(StatusCode.OK.status).json({
        ...StatusCode.OK,
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      });
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default userController;
