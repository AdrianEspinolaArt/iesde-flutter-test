import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

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