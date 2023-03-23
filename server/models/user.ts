import { db } from '@/config/db';
import { IUser } from '@/types/types';

const User = {
  signup: async (user: IUser) => {
    await db.query(`INSERT INTO USER (id, password) VALUES (?, ?);`, [
      user.id,
      user.password,
    ]);
  },
  findUserByID: async (id: string) => {
    const result = await db.query(`SELECT * FROM USER WHERE id = ?`, [id]);
    return result;
  },
};

export default User;
