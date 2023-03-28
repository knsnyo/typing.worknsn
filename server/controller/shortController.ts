import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Short from '@/models/short';
import { IShort } from '@/types/types';

const shortController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { name, short }: IShort = req.body;
    await Short.insert({ name: name, short: short });
    return res.status(SC.CREATED.status).json(SC.CREATED);
  },
  select: async (req: Request, res: Response): Promise<Response> => {
    const [short]: Array<IShort> = await Short.select();
    return res.status(SC.OK.status).json(short);
  },
};

export default shortController;
