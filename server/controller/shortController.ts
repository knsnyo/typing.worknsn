import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Short from '@/models/short';

const shortController = {
  insert: async (req: Request, res: Response) => {
    const { name, short } = req.body;
    await Short.insert({ name: name, short: short });
    res.status(SC.CREATED.status).json(SC.CREATED);
  },
  select: async (req: Request, res: Response) => {
    const [short] = await Short.select();
    res.status(SC.OK.status).json(short);
  },
};

export default shortController;
