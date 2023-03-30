import Word from '@/models/Word';
import { IWord } from '@/types/types';
import { BodyError, NotFoundError } from '@/utils/Error';

const wordService = {
  insert: async ({ word }: IWord): Promise<void> => {
    if (!word) {
      throw new BodyError(`WORD IS INVALID`);
    }
    await Word.insert({ word });
  },
  select: async (): Promise<IWord> => {
    const word = await Word.select();
    if (!word) {
      throw new NotFoundError(`WORD IS NOT FOUND`);
    }
    return word;
  },
};

export default wordService;
