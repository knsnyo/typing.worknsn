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

export { IUser, IPosition, IWord, IShort, IRecord };
