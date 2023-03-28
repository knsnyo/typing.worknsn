import { Request, Response } from 'express';
import SC from '@/utils/StatusCode';
import { IWord } from '@/types/types';
import wordService from '@/services/wordService';

const wordController = {
  insert: async (req: Request, res: Response): Promise<Response> => {
    const { word }: IWord = req.body;
    try {
      await wordService.insert({ word: word });
      return res.status(SC.CREATED.status).json(SC.CREATED);
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
  select: async (req: Request, res: Response): Promise<Response> => {
    try {
      const word: IWord = await wordService.select();
      return res.status(SC.OK.status).json(word);
    } catch (err) {
      return res.status(SC.SERVER_ERROR.status).json({ ...SC.SERVER_ERROR, err: `${err instanceof Error ? err.message : String(err)}` });
    }
  },
};

export default wordController;
