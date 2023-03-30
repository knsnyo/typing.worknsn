import { db } from '@/config/db';
import queries from '@/queries';
import type { IWord } from '@/types/types';
import { QueryError } from '@/utils/Error';

const Word = {
  insert: async ({ word }: IWord): Promise<void> => {
    await db.execute(queries.word.insert, [word]);
  },
  select: async (): Promise<IWord> => {
    try {
      const [word]: Array<IWord> = await db.query(queries.word.select);
      return word;
    } catch (err: unknown) {
      throw new QueryError(`${err}`);
    }
  },
};

export default Word;
