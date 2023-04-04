import Short from '@/models/Short';
import { IShort } from '@/types/types';
import { BodyError, NotFoundError, QueryResponseError } from '@/utils/Error';

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
      throw new NotFoundError(`SHORT IS NOT FOUND`);
    }
    return short;
  },
  init: async (): Promise<Array<IShort>> => {
    const shorts: Array<IShort> = await Short.init();
    if (2 != shorts.length) {
      throw new QueryResponseError(`WORDS.LENGTH IS NOT 2`);
    }
    return shorts;
  },
};
export default shortService;
