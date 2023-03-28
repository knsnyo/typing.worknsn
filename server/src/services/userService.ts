import User from '@/models/User';
import { IUser } from '@/types/types';
import { BodyError } from '@/utils/Error';

const userService = {
  signup: async ({ id, password }: IUser): Promise<void> => {
    if (!id) {
      throw new BodyError(`ID IS INVALID`);
    }
    if (!password) {
      throw new BodyError(`PASSWORD IS INVALID`);
    }
    await User.signup({ id, password });
  },
  findUserByID: async (id: string): Promise<IUser> => {
    if (!id) {
      throw new BodyError(`ID IS INVALID`);
    }
    return await User.findUserByID(id);
  },
};

export default userService;
