import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import { IRecord } from '@/types/types';
import recordService from '@/services/recordService';
import { QueryError } from '@/utils/Error';

const recordController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { idx, speed } = req.body;
    const data: IRecord = {
      user: idx,
      speed: speed,
    };
    try {
      await recordService.insert(data);
      return res.status(SC.CREATED.status).json({
        ...SC.CREATED,
        accessToken: req.body.accessToken,
      });
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
  getInfo: async (req: Request, res: Response): Promise<Response> => {
    const idx: number = req.body.idx;
    try {
      const records: Array<IRecord> = await recordService.select(idx);
      if (0 === records.length) {
        throw new QueryError(`RECORD IS EMPTY`);
      }
      return res.status(SC.OK.status).json({
        ...SC.OK,
        ...records,
        accessToken: req.body.accessToken,
      });
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
};

export default recordController;
