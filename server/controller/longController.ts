import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Long from '@/models/long';

const LongController = {
  insert: async (req: Request, res: Response) => {
    const { title, long } = req.body;
    await Long.insert({ title: title, long: long });
    res.status(SC.CREATED.status).json(SC.CREATED);
  },
  select: async (req: Request, res: Response) => {
    const long = Long.select();
    res.status(SC.OK.status).json({ long: long });
  },
};

export default LongController;
