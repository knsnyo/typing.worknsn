import Record from '@/models/Record';
import { IRecord } from '@/types/types';
import { BodyError } from '@/utils/Error';

const recordService = {
  insert: async ({ user, speed }: IRecord): Promise<void> => {
    if (!user) {
      throw new BodyError(`USER IS INVALID`);
    }
    if (!speed) {
      throw new BodyError(`SPEED IS INVALID`);
    }
    await Record.insert({ user, speed });
  },
  select: async (idx: number): Promise<Array<IRecord>> => {
    if (!idx) {
      throw new BodyError(`IDX IS INVALID`);
    }
    return await Record.select(idx);
  },
};

export default recordService;
