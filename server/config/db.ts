import { createPool, Pool } from 'mysql2/promise';
import 'dotenv/config';

const config = {
  host: process.env.DB_HOST,
  port: parseInt(process.env.DB_PORT!),
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
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

  async query(sql: string, values?: any[]): Promise<any> {
    let connection;
    try {
      connection = await this.pool.getConnection();
      const [result] = await connection.query(sql, values);
      return result;
    } catch (err) {
      throw err;
    } finally {
      if (connection) {
        connection.release();
      }
    }
  }
}

export const db = DB.getInstance();
