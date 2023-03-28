import { NextFunction, Request, Response } from 'express';
import { compare, genSalt, hash } from 'bcrypt';
import User from '@/models/user';
import SC from '@/utils/StatusCode';
import { IUser } from '@/types/types';

const userController = {
  signup: async (req: Request, res: Response): Promise<Response> => {
    const { id, password }: IUser = req.body;
    try {
      const find: Array<IUser> | Array<null> = await User.findUserByID(id);
      if (0 !== find.length) {
        return res.status(SC.CONFLICT.status).json(SC.CONFLICT);
      }
      const salt: string = await genSalt(10);
      const hashed: string = await hash(password, salt);
      const user: IUser = {
        id: id,
        password: hashed,
      };
      await User.signup(user);
      return res.status(SC.CREATED.status).json(SC.CREATED);
    } catch (err: unknown) {
      return res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },
  signin: async (req: Request, res: Response, next: NextFunction): Promise<Response | void> => {
    const { id, password }: IUser = req.body;
    try {
      const find: IUser | undefined = (await User.findUserByID(id)).at(0);
      if (!find) {
        return res.status(SC.NOT_FOUND.status).json(SC.NOT_FOUND);
      }
      const validated = await compare(password, find.password);
      if (!validated) {
        return res.status(SC.UNAUTHORIZED.status).json(SC.UNAUTHORIZED);
      }
      req.body.idx = find.idx;
      next();
    } catch (err: unknown) {
      console.error(err);
      return res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },
};

export default userController;
