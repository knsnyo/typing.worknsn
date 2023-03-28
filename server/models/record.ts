import { db } from '@/config/db';
import { IRecord } from '@/types/types';

const Record = {
  insert: async ({ user, speed }: IRecord): Promise<void> => {
    await db.query(
      `INSERT INTO RECORD(user, speed, date) VALUES (?, ?, NOW());`,
      [user, speed]
    );
  },
  select: async (idx: number): Promise<Array<IRecord>> => {
    const records: Array<IRecord> = await db.query(
      `SELECT * FROM RECORD WHERE user = ?`,
      [idx]
    );
    return records;
  },
};

export default Record;
