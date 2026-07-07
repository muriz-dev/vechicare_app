import '../../../data/models/user_model.dart';

sealed class AuthState {}

class AuthInitial implements AuthState {}

class AuthLoading implements AuthState {}

class AuthAuthenticated implements AuthState {
  final UserModel user;

  const AuthAuthenticated(this.user);
}

class AuthUnauthenticated implements AuthState {}

class AuthError implements AuthState {
  final String message;

  const AuthError(this.message);
}
