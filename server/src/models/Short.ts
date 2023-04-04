import { db } from '@/config/db';
import queries from '@/queries';
import type { IShort } from '@/types/types';
import { QuerySyntexError } from '@/utils/Error';

const Short = {
  insert: async ({ name, short }: IShort): Promise<void> => {
    try {
      await db.execute(queries.short.insert, [name, short]);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  select: async (): Promise<IShort> => {
    try {
      const [short]: Array<IShort> = await db.query(queries.short.select);
      return short;
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  init: async (): Promise<Array<IShort>> => {
    try {
      return await db.query(queries.short.init);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
};

export default Short;
