abstract class AuthEvent {}

class SigninEvent extends AuthEvent {
  final String id;
  final String password;

  SigninEvent(this.id, this.password);
}

class SignupEvent extends AuthEvent {
  final String id;
  final String password;

  SignupEvent(this.id, this.password);
}

class SignoutEvent extends AuthEvent {}

class AutoEvent extends AuthEvent {}
