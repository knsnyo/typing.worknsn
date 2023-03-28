class Record {
  final int speed;
  final DateTime date;
  String? accessToken;

  Record({
    required this.speed,
    required this.date,
    this.accessToken,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        speed: json['speen'],
        date: json['date'],
        accessToken: json['accessToken'],
      );
}
