import { Request, Response } from 'express';
import StatusCode from '@/utils/StatusCode';
import positionService from '@/services/positionService';
import errorCatch from '@/utils/errJson';

const positionController = {
  level: async (req: Request, res: Response): Promise<Response> => {
    const level: string = req.params.level;
    try {
      const letter = positionService.level(level);
      return res.status(StatusCode.OK.status).json({ letter: letter });
    } catch (err: unknown) {
      return errorCatch(err, res);
    }
  },
};

export default positionController;
