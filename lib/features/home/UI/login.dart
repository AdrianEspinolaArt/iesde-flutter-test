import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/features/home/bloc/login_bloc.dart';


class MyLogin extends StatelessWidget {
  const MyLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              GoRouter.of(context).go('/catalog');
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const CircularProgressIndicator();
              } else if (state is AuthError) {
                return Text('Error: ${state.errorMessage}');
              } else {
                return _buildLoginForm(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    String? username;
    String? password;

    return Container(
      padding: const EdgeInsets.all(80.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem Vindo',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 40,),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nome de usuário',
            ),
            onChanged: (value) => username = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Senha',
            ),
            obscureText: true,
            onChanged: (value) => password = value,
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {
              if (username != null && password != null) {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoginEvent(username!, password!),
                );
              } else {
                _exibirErroLoginDialog(context);
              }
            },
            child: const Text('ENTRAR'),
          ),
        ],
      ),
    );
  }

  void _exibirErroLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Erro'),
        content: const Text('Por favor, insira um nome de usuário e uma senha válidos.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}