import { db } from '@/config/db';
import { IRecord } from '@/types/types';

const Record = {
  select: async (idx: number) => {
    const records = await db.query(`SELECT * FROM RECORD WHERE user = ?`, [
      idx,
    ]);
    return records;
  },

  insert: async ({ user, speed }: IRecord) => {
    await db.query(
      `INSERT INTO RECORD(user, speed, date) VALUES (?, ?, NOW());`,
      [user, speed]
    );
  },
};

export default Record;
