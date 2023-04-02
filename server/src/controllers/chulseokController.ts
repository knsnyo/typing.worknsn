import chulseokService from '@/services/chulseokService';
import { IChulseok } from '@/types/types';
import errorCatch from '@/utils/errJson';
import SC from '@/utils/StatusCode';
import { Request, Response } from 'express';

const chulseokController = {
  getList: async (req: Request, res: Response): Promise<Response> => {
    const { idx }: { idx: number } = req.body;
    try {
      const chulseoks: Array<IChulseok> = await chulseokService.getList(idx);
      return res.status(SC.OK.status).json({
        ...SC.OK,
        chulseoks: chulseoks,
        accessToken: req.body.accessToken,
      });
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default chulseokController;
