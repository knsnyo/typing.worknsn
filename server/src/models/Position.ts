import { ParamsError } from '@/utils/Error';

const alphabet: Array<Array<string>> = [
  ['a', 's', 'd', 'f', 'j', 'k', 'l', ';'],
  ['q', 'w', 'e', 'r'],
  ['u', 'i', 'o', 'p'],
  ['t', 'y', 'g', 'h', 'b', 'n'],
  ['z', 'x', 'c', 'v'],
  ['m', ',', '.', '/'],
  ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
];

const Position = {
  select: (level: number): string => {
    if (alphabet[level] && alphabet[level].length > 0) {
      const random: number = Math.floor(Math.random() * alphabet[level].length);
      return alphabet[level][random];
    }
    throw new ParamsError(`LEVEL IS INVALID`);
  },
};

export default Position;