import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import Word from '@/models/word';
import { IWord } from '@/types/types';

const wordController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { word }: IWord = req.body;
    await Word.insert({ word: word });
    return res.status(SC.CREATED.status).json(SC.CREATED);
  },
  select: async (req: Request, res: Response): Promise<Response> => {
    const [word]: Array<IWord> = await Word.select();
    return res.status(SC.OK.status).json(word);
  },
};

export default wordController;
