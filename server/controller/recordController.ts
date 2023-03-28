import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Record from '@/models/record';
import { IRecord } from '@/types/types';

const recordController = {
  getInfo: async (req: Request, res: Response): Promise<Response> => {
    const idx: number = req.body.idx;
    try {
      const [data]: Array<IRecord> = await Record.select(idx);
      return res.status(SC.OK.status).json({
        ...SC.OK,
        ...data,
        accessToken: req.body.accessToken,
      });
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR.status);
    }
  },
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { idx, speed } = req.body;
    const data: IRecord = {
      user: idx,
      speed: speed,
    };
    try {
      await Record.insert(data);
      return res.status(SC.CREATED.status).json({
        ...SC.CREATED,
        accessToken: req.body.accessToken,
      });
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json(SC.SERVER_ERROR);
    }
  },
};

export default recordController;
