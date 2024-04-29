import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthInitial()) {
    on<LoginEvent>(_mapLoginEventToState);
  }

  void _mapLoginEventToState(LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 0));
    emit(AuthAuthenticated());
  }
}