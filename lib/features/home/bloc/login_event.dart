part of 'login_bloc.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);
}
