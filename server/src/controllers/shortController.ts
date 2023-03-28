import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import { IShort } from '@/types/types';
import shortService from '@/services/shortService';

const shortController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { name, short }: IShort = req.body;
    try {
      await shortService.insert({ name: name, short: short });
      return res.status(SC.CREATED.status).json(SC.CREATED);
    } catch (err: unknown) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
  select: async (req: Request, res: Response): Promise<Response> => {
    try {
      const short: IShort = await shortService.select();
      return res.status(SC.OK.status).json(short);
    } catch (err: unknown) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
};

export default shortController;
