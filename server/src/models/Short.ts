import { db } from '@/config/db';
import queries from '@/queries';
import type { IShort } from '@/types/types';
import { QueryError } from '@/utils/Error';

const Short = {
  insert: async ({ name, short }: IShort): Promise<void> => {
    try {
      await db.execute(queries.short.insert, [name, short]);
    } catch (err: unknown) {
      throw new QueryError(`${err}`);
    }
  },
  select: async (): Promise<IShort> => {
    try {
      const [short]: Array<IShort> = await db.query(queries.short.select);
      return short;
    } catch (err: unknown) {
      throw new QueryError(`${err}`);
    }
  },
};

export default Short;
