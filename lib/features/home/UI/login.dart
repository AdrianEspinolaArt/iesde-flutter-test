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
            'Welcome',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            onChanged: (value) => username = value,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            obscureText: true,
            onChanged: (value) => password = value,
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              if (username != null && password != null) {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoginEvent(username!, password!),
                );
              } else {
                // Trate o caso em que username ou password é null
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
            ),
            child: const Text('ENTER'),
          ),
        ],
      ),
    );
  }
}
