import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:processo_selecao_iesde/Routes/routes.dart';
import 'package:processo_selecao_iesde/features/home/bloc/login_bloc.dart';
import 'package:provider/provider.dart';
import 'package:processo_selecao_iesde/common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = AuthenticationBloc();
    return MultiProvider(
      providers: [
            BlocProvider<AuthenticationBloc>.value(value: authenticationBloc),
          ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
        primaryColor: lightColorScheme.primary,
       
       elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Color(0xFF22005D)), // Cor da borda do Button
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Raio de curvatura da borda
            ),
          ),
          ),
        ),
       cardTheme: CardTheme(
            elevation: 5,
            color: lightColorScheme.background.withOpacity(1.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: Color(0xFF6750A4), ), 
            ),
          ),

        chipTheme: const ChipThemeData(
          
          backgroundColor: Color(0xFFE9DDFF),
          ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: Colors.white,
          ),

        dialogTheme: DialogTheme(
          backgroundColor: lightColorScheme.primaryContainer,
        ),

        drawerTheme: DrawerThemeData(
          backgroundColor: lightColorScheme.secondaryContainer,
          ),

        scaffoldBackgroundColor: lightColorScheme.secondaryContainer,  
        appBarTheme: AppBarTheme(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary     
             
        ),

        bottomAppBarTheme: BottomAppBarTheme(
          color: lightColorScheme.primaryContainer.withOpacity(1.0),
          ),
        
        useMaterial3: true, 
        colorScheme: lightColorScheme,
        ),
        
        
        
        
        
        
        
        
        
        routerDelegate: routes.routerDelegate,
        routeInformationParser: routes.routeInformationParser,
        routeInformationProvider: routes.routeInformationProvider,
      ),
    );
  }
}