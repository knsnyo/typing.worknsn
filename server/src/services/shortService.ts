import Short from '@/models/Short';
import { IShort } from '@/types/types';
import { BodyError, QueryError } from '@/utils/Error';

const shortService = {
  insert: async ({ name, short }: IShort): Promise<void> => {
    if (!name) {
      throw new BodyError(`NAME IS INVALID`);
    }
    if (!short) {
      throw new BodyError(`SHORT IS INVALID`);
    }
    await Short.insert({ name: name, short: short });
  },
  select: async (): Promise<IShort> => {
    const short: IShort = await Short.select();
    if (!short) {
      throw new QueryError(`SHORT IS NULL`);
    }
    return short;
  },
};
export default shortService;
