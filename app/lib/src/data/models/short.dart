class Short {
  final String name;
  final String short;

  const Short({required this.name, required this.short});

  factory Short.fromJson(Map<String, dynamic> json) => Short(
        name: json['name'] as String,
        short: json['short'] as String,
      );
}
