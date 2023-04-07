import { Request, Response } from 'express';
import StatusCode from '@/utils/StatusCode';
import { IRecord } from '@/types/types';
import recordService from '@/services/recordService';
import errorCatch from '@/utils/errCatch';

const recordController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { idx, speed } = req.body;
    const data: IRecord = {
      user: idx,
      speed: speed,
    };
    try {
      await recordService.insert(data);
      return res.status(StatusCode.CREATED.status).json({
        ...StatusCode.CREATED,
        accessToken: req.body.accessToken,
      });
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
  getInfo: async (req: Request, res: Response): Promise<Response> => {
    const idx: number = req.body.idx;
    try {
      const records: Array<IRecord> = await recordService.select(idx);
      return res.status(StatusCode.OK.status).json({
        ...StatusCode.OK,
        records: records,
        accessToken: req.body.accessToken,
      });
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default recordController;
