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

interface ILong {
  title: string;
  long: string;
}

export { IUser, IWord, IShort, ILong };
