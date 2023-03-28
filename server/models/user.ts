import { db } from '@/config/db';
import { IUser } from '@/types/types';

const User = {
  signup: async (user: IUser): Promise<void> => {
    await db.query(`INSERT INTO USER (id, password) VALUES (?, ?);`, [
      user.id,
      user.password,
    ]);
  },
  findUserByID: async (id: string): Promise<Array<IUser>> => {
    const result: Array<IUser> = await db.query(
      `SELECT * FROM USER WHERE id = ?`,
      [id]
    );
    return result;
  },
};

export default User;
