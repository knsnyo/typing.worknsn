import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Word from '@/models/word';

const wordController = {
  insert: async (req: Request, res: Response) => {
    const { word } = req.body;
    await Word.insert({ word: word });
    res.status(SC.CREATED.status).json(SC.CREATED);
  },
  select: async (req: Request, res: Response) => {
    const [word] = await Word.select();
    res.status(SC.OK.status).json(word);
  },
};

export default wordController;
