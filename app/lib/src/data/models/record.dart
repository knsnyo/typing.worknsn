class Record {
  final int speed;
  final DateTime date;

  const Record({
    required this.speed,
    required this.date,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        speed: json['speed'] as int,
        date: DateTime.parse(json['date'] as String),
      );
}
