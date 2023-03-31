import { createPool, Pool } from 'mysql2/promise';
import { DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD } from '@/constants/constatns';
import { DBError } from '@/utils/Error';
import { IConfig } from '@/types/types';

const config: IConfig = {
  host: DB_HOST!,
  port: parseInt(DB_PORT!),
  database: DB_NAME!,
  user: DB_USER!,
  password: DB_PASSWORD!,
  multipleStatements: true,
};

class DB {
  private static instance: DB | undefined;
  private pool: Pool;

  private constructor() {
    this.pool = createPool(config);
  }

  public static getInstance(): DB {
    if (!DB.instance) {
      DB.instance = new DB();
    }
    return DB.instance;
  }

  async query(sql: string, values?: Array<any>): Promise<any> {
    let connection;
    try {
      connection = await this.pool.getConnection();
      const [result] = await connection.execute(sql, values);
      return result;
    } catch (err: unknown) {
      throw new DBError(`${err}`);
    } finally {
      if (connection) {
        connection.release();
      }
    }
  }

  async execute(sql: string, values?: Array<any>): Promise<any> {
    let connection;
    try {
      connection = await this.pool.getConnection();
      await connection.beginTransaction();
      await connection.execute(sql, values);
      await connection.commit();
    } catch (err: unknown) {
      await connection?.rollback();
      throw new DBError(`${err}`);
    } finally {
      if (connection) {
        connection.release();
      }
    }
  }
}

export const db = DB.getInstance();
