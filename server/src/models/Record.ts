import { db } from '@/config/db';
import { IRecord } from '@/types/types';
import queries from '@/queries/index';
import { QuerySyntexError } from '@/utils/Error';

const Record = {
  insert: async ({ user, speed }: IRecord): Promise<void> => {
    try {
      await db.execute(queries.record.insert, [user, speed]);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  select: async (idx: number): Promise<Array<IRecord>> => {
    try {
      const records: Array<IRecord> = await db.query(queries.record.select, [idx]);
      return records;
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
};

export default Record;
