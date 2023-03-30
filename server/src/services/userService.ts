import User from '@/models/User';
import { IUser } from '@/types/types';
import { BodyError, NotFoundError, ParamsError, SigninError, SignupError } from '@/utils/Error';
import { compare, genSalt, hash } from 'bcrypt';

const userService = {
  checkDuplicatdId: async (id: string): Promise<void> => {
    if (!id) {
      throw new BodyError(`ID IS INVALID`);
    }
    const user: IUser = await User.findUserByID(id);
    if (user) {
      throw new SignupError(`USER ALREADY EXIST`);
    }
  },
  signup: async ({ id, password }: IUser): Promise<void> => {
    if (!id) {
      throw new BodyError(`ID IS INVALID`);
    }
    if (!password) {
      throw new BodyError(`PASSWORD IS INVALID`);
    }
    const salt: string = await genSalt(10);
    const hashed: string = await hash(password, salt);
    const user: IUser = {
      id: id,
      password: hashed,
    };
    await User.signup(user);
  },
  findUserById: async (id: string): Promise<IUser> => {
    if (!id) {
      throw new BodyError(`ID IS INVALID`);
    }
    const user: IUser = await User.findUserByID(id);
    if (!user) {
      throw new NotFoundError(`USER NOT FOUND`);
    }
    return user;
  },
  checkPassword: async (userPassword: string, dbPassword: string): Promise<void> => {
    if (!userPassword) {
      throw new BodyError(`PASSWORD IS INVALID`);
    }
    if (!dbPassword) {
      throw new ParamsError(`DB PASSWORD IS INVALID`);
    }
    const validated: boolean = await compare(userPassword, dbPassword);
    if (!validated) {
      throw new SigninError(`PASSWORD IS NOT CORRECT`);
    }
  },
};

export default userService;
