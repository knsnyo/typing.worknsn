class User {
  final String accessToken;
  final String refreshToken;

  const User({required this.accessToken, required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );
}
