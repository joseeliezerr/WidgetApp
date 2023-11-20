import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widget_app/presentation/screens/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
     GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
     GoRoute(
      path: '/cards',
      name:CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);