interface IUser {
  id: string;
  password: string;
}

interface IWord {
  word: string;
}

interface IShort {
  name: string;
  short: string;
}

interface IRecord {
  user: number;
  speed: number;
}

export { IUser, IWord, IShort, IRecord };
