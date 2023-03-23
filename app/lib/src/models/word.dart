class Word {
  final String word;

  Word({required this.word});

  factory Word.fromJson(Map<String, dynamic> json) => Word(word: json['word']);
}
