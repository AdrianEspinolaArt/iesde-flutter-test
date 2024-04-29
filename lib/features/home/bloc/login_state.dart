part of 'login_bloc.dart';

abstract class AuthenticationState {}

class AuthInitial extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuthAuthenticated extends AuthenticationState {}

class AuthError extends AuthenticationState {
  final String errorMessage;

  AuthError(this.errorMessage);
}
