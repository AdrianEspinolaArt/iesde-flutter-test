import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);
}

// Defina os estados possíveis para o bloco
abstract class AuthenticationState {}

class AuthInitial extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuthAuthenticated extends AuthenticationState {}

class AuthError extends AuthenticationState {
  final String errorMessage;

  AuthError(this.errorMessage);
}


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthInitial()) {
    on<LoginEvent>(_mapLoginEventToState);
  }

  void _mapLoginEventToState(LoginEvent event, Emitter<AuthenticationState> emit) async {
    // Emitir um estado de carregamento
    emit(AuthLoading());

    // Simular um atraso antes de emitir o estado autenticado
    await Future.delayed(const Duration(seconds: 1));

    // Emitir um estado de autenticação bem-sucedida após o atraso
    emit(AuthAuthenticated());
  }
}