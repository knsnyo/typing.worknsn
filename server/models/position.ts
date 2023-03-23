const alphabet = [
  ['a', 's', 'd', 'f', 'j', 'k', 'l', ';'],
  ['q', 'w', 'e', 'r'],
  ['u', 'i', 'o', 'p'],
  ['t', 'y', 'g', 'h', 'b', 'n'],
  ['z', 'x', 'c', 'v'],
  ['m', ',', '.', '/'],
  ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
];

const Position = {
  select: (level: number) => {
    const random = Math.floor(Math.random() * alphabet.at(level)!.length);
    return alphabet.at(level)!.at(random);
  },
};

export default Position;
