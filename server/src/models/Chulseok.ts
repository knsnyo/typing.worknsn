import { db } from '@/config/db';
import queries from '@/queries';
import { IChulseok } from '@/types/types';
import { QueryError } from '@/utils/Error';

const Chulseok = {
  getList: async (idx: number): Promise<Array<IChulseok>> => {
    try {
      const chulseoks: Array<IChulseok> = await db.query(queries.chulseok.getList, [idx]);
      console.log(chulseoks);
      return chulseoks;
    } catch (err: unknown) {
      throw new QueryError(`${err}`);
    }
  },
};

export default Chulseok;
