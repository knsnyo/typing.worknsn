import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Position from '@/models/position';

const positionController = {
  level: async (req: Request, res: Response): Promise<Response> => {
    const level: number = parseInt(req.params.level);
    const letter: string = Position.select(level);
    return res.status(SC.OK.status).json({ letter: letter });
  },
};

export default positionController;
