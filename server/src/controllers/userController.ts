import { NextFunction, Request, Response } from 'express';
import { compare, genSalt, hash } from 'bcrypt';
import SC from '@/utils/StatusCode';
import { IUser } from '@/types/types';
import userService from '@/services/userService';

const userController = {
  signup: async (req: Request, res: Response): Promise<Response> => {
    const { id, password }: IUser = req.body;
    try {
      const find: IUser = await userService.findUserByID(id);
      if (find) {
        return res.status(SC.CONFLICT.status).json(SC.CONFLICT);
      }
      const salt: string = await genSalt(10);
      const hashed: string = await hash(password, salt);
      const user: IUser = {
        id: id,
        password: hashed,
      };
      await userService.signup(user);
      return res.status(SC.CREATED.status).json(SC.CREATED);
    } catch (err: unknown) {
      return res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },
  signin: async (req: Request, res: Response, next: NextFunction): Promise<Response | void> => {
    const { id, password }: IUser = req.body;
    try {
      const find: IUser = await userService.findUserByID(id);
      if (!find) {
        return res.status(SC.NOT_FOUND.status).json(SC.NOT_FOUND);
      }
      const validated: boolean = await compare(password, find.password);
      if (!validated) {
        return res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
      }
      req.body.idx = find.idx;
      next();
    } catch (err: unknown) {
      return res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },
};

export default userController;
