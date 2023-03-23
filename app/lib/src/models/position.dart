class Position {
  final String letter;

  Position({required this.letter});

  factory Position.fromJson(Map<String, dynamic> json) =>
      Position(letter: json['letter']);
}
