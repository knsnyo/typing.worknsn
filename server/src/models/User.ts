import { db } from '@/config/db';
import queries from '@/queries';
import { IUser } from '@/types/types';
import { QuerySyntexError } from '@/utils/Error';

const User = {
  signup: async ({ id, password }: IUser): Promise<void> => {
    try {
      await db.execute(queries.user.signup, [id, password]);
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
  findUserById: async (id: string): Promise<IUser> => {
    try {
      const [result]: Array<IUser> = await db.query(queries.user.findUserById, [id]);
      return result;
    } catch (err: unknown) {
      throw new QuerySyntexError(`${err}`);
    }
  },
};

export default User;
