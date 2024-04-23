import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:processo_selecao_iesde/Bloc/catalog_bloc.dart';
import 'package:processo_selecao_iesde/bloc/authentication_bloc.dart';
import 'package:processo_selecao_iesde/models/catalog_model.dart';
import 'package:processo_selecao_iesde/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Inicialize o AuthenticationBloc
    final authenticationBloc = AuthenticationBloc();
    final catalogModel = CatalogModel();
    final catalogBloc = CatalogBloc(catalogModel);

    return MultiProvider(
      providers: [
            BlocProvider<AuthenticationBloc>.value(value: authenticationBloc),
            BlocProvider<CatalogBloc>.value(value: catalogBloc),
          ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 183, 58, 58)),
          useMaterial3: true,
        ),
        routerDelegate: routes.routerDelegate,
        routeInformationParser: routes.routeInformationParser,
        routeInformationProvider: routes.routeInformationProvider,
      ),
    );
  }
}