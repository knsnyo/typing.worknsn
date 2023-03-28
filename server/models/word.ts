import { db } from '@/config/db';
import type { IWord } from '@/types/types';

const Word = {
  insert: async (word: IWord): Promise<void> => {
    await db.query(`INSERT INTO WORD (word) VALUES (?);`, [word.word]);
  },
  select: async (): Promise<Array<IWord>> => {
    const word: Array<IWord> = await db.query(
      `SELECT * FROM WORD ORDER BY RAND() LIMIT 1;`
    );
    return word;
  },
};

export default Word;
