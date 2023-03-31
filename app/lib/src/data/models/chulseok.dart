class Chulseok {
  final DateTime date;
  final int done;

  Chulseok({required this.date, required this.done});

  factory Chulseok.fromJson(Map<String, dynamic> json) => Chulseok(
        date: DateTime.parse(json['date']),
        done: json['done'],
      );
}
