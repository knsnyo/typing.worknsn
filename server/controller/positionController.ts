import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Position from '@/models/position';

const positionController = {
  level: async (req: Request, res: Response) => {
    const level: number = parseInt(req.params.level);
    const letter = Position.select(level);
    res.status(SC.OK.status).json({ letter: letter });
  },
};

export default positionController;
