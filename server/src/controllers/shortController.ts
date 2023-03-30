import { Request, Response } from 'express';
import StatusCode from '@/utils/StatusCode';
import { IShort } from '@/types/types';
import shortService from '@/services/shortService';
import errorCatch from '@/utils/errJson';

const shortController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { name, short }: IShort = req.body;
    try {
      await shortService.insert({ name: name, short: short });
      return res.status(StatusCode.CREATED.status).json(StatusCode.CREATED);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  select: async (req: Request, res: Response): Promise<Response> => {
    try {
      const short: IShort = await shortService.select();
      return res.status(StatusCode.OK.status).json(short);
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default shortController;
