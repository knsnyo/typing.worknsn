abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class AuthenticatedAuthState extends AuthState {}

class UnauthenticatedAuthState extends AuthState {}
