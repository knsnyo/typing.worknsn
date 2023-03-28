import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import positionService from '@/services/positionService';

const positionController = {
  level: async (req: Request, res: Response): Promise<Response> => {
    const level: string = req.params.level;
    try {
      const letter = positionService.level(level);
      return res.status(SC.OK.status).json({ letter: letter });
    } catch (err: unknown) {
      return res.status(SC.SERVER_ERROR.status).json({
        ...SC.SERVER_ERROR,
        err: `${err instanceof Error ? err.message : String(err)}`,
      });
    }
  },
};

export default positionController;
