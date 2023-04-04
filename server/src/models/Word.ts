import { db } from '@/config/db';
import queries from '@/queries';
import type { IWord } from '@/types/types';
import { QuerySyntexError } from '@/utils/Error';

const Word = {
  insert: async ({ word }: IWord): Promise<void> => {
    try {
      await db.execute(queries.word.insert, [word]);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  select: async (): Promise<IWord> => {
    try {
      const [word]: Array<IWord> = await db.query(queries.word.select);
      return word;
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  init: async (): Promise<Array<IWord>> => {
    try {
      return await db.query(queries.word.init);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
};

export default Word;
