import { NextFunction, Request, Response } from 'express';
import { compare, genSalt, hash } from 'bcrypt';
import User from '@/models/user';
import SC from '@/utils/StatusCode';

const userController = {
  signup: async (req: Request, res: Response) => {
    const { id, password } = req.body;
    try {
      const find = await User.findUserByID(id);
      if (0 !== find.length) {
        return res.status(SC.CONFLICT.status).json(SC.CONFLICT);
      }
      const salt = await genSalt(10);
      const hashed = await hash(password, salt);
      const user = {
        id: id,
        password: hashed,
      };
      await User.signup(user);
      res.status(SC.CREATED.status).json(SC.CREATED);
    } catch (err: unknown) {
      res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },

  signin: async (req: Request, res: Response, next: NextFunction) => {
    const { id, password } = req.body;
    try {
      const find = (await User.findUserByID(id)).at(0);
      if (0 === find.length) {
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
      res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },
};

export default userController;
