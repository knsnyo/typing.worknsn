import Chulseok from '@/models/Chulseok';
import { IChulseok } from '@/types/types';
import { BodyError } from '@/utils/Error';

const chulseokService = {
  getList: async (idx: number): Promise<Array<IChulseok>> => {
    if (!idx) {
      throw new BodyError(`IDX IS INVALID`);
    }
    return await Chulseok.getList(idx);
  },
};

export default chulseokService;
