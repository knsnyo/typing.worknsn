import { db } from '@/config/db';
import type { IShort } from '@/types/types';

const Short = {
  insert: async (short: IShort) => {
    await db.query(`INSERT INTO SHORT (name, short) VALUES (?, ?);`, [
      short.name,
      short.short,
    ]);
  },

  select: async () => {
    const short = await db.query(
      `SELECT * FROM SHORT ORDER BY RAND() LIMIT 1;`
    );
    return short;
  },
};

export default Short;
