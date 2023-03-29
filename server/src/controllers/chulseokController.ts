import chulseokService from '@/services/chulseokService';
import { IChulseok } from '@/types/types';
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
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
};

export default chulseokController;
