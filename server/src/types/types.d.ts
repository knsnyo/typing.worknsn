interface IUser {
  idx?: number;
  id: string;
  password: string;
}

interface IPosition {
  idx?: number;
  letter: string;
}

interface IWord {
  idx?: number;
  word: string;
}

interface IShort {
  idx?: number;
  name: string;
  short: string;
}

interface IRecord {
  idx?: number;
  user: number;
  speed: number;
  date?: Date;
}

interface IChulseok {
  idx: number;
  date: Date;
  done: number;
}

interface IConfig {
  host: string;
  port?: number;
  database: string;
  user: string;
  password: string;
  multipleStatements: boolean;
}

export { IUser, IPosition, IWord, IShort, IRecord, IChulseok, IConfig };
