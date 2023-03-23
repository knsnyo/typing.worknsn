import { db } from '@/config/db';
import type { ILong } from '@/types/types';

const Long = {
  insert: async (long: ILong) => {
    await db.query(`INSERT INTO LONG (title, long) VALUES (?, ?);`, [
      long.title,
      long.long,
    ]);
  },

  select: async () => {
    const long = await db.query(`SELECT * FROM LONG ORDER BY RAND() LIMIT 1;`);
    return long;
  },
};

export default Long;
