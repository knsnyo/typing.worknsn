import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Record from '@/models/record';

const recordController = {
  getInfo: async (req: Request, res: Response) => {
    const idx = req.body.idx;
    try {
      const [data] = await Record.select(idx);
      res.status(SC.OK.status).json(data);
    } catch (err) {
      res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR.status);
    }
  },

  insert: async (req: Request, res: Response) => {
    try {
      await Record.insert(req.body);
      res.status(SC.CREATED.status).json(SC.CREATED);
    } catch (err) {
      res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR.status);
    }
  },
};

export default recordController;
