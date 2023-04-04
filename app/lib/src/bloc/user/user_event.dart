part of 'user_bloc.dart';

abstract class UserEvent {}

class UserSigninEvent extends UserEvent {}

class UserSignoutEvent extends UserEvent {}
