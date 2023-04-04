class UserModel {
  bool user;
  UserModel({required this.user});

  UserModel copyWith(bool user) {
    print('UserModel: $user');
    return UserModel(user: user);
  }
}
