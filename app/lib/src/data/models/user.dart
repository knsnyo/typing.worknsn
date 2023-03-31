class User {
  final String accessToken;
  final String refreshToken;

  User({required this.accessToken, required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );
}
