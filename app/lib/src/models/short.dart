class Short {
  final String name;
  final String short;

  Short({required this.name, required this.short});

  factory Short.fromJson(Map<String, dynamic> json) =>
      Short(name: json['name'], short: json['short']);
}
