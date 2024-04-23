import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/screens/cart.dart';
import 'package:processo_selecao_iesde/screens/catalog.dart';
import 'package:processo_selecao_iesde/screens/login.dart';

// GoRouter configuration
final routes = GoRouter(
  initialLocation: '/login', // Definindo a rota inicial como a tela de login
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const MyLogin(),
    ),
    GoRoute(
      path: '/catalog',
      builder: (context, state) => CatalogPage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const MyCart(),
    ),
  ],
);

