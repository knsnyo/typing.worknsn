class Record {
  final int speed;
  final DateTime date;

  Record({
    required this.speed,
    required this.date,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        speed: json['speen'],
        date: DateTime.parse(json['date']),
      );
}
