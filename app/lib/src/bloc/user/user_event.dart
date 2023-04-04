abstract class UserEvent {}

class SigninEvent extends UserEvent {
  final String id;
  final String password;

  SigninEvent(this.id, this.password);
}

class SignupEvent extends UserEvent {
  final String id;
  final String password;

  SignupEvent(this.id, this.password);
}

class SignoutEvent extends UserEvent {}

class AutoEvent extends UserEvent {}
