import 'package:go_router/go_router.dart';
import 'package:karera/config/router/route_links.dart';
import 'package:karera/features/game/presentation/pages/game_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: _routes,
    initialLocation: RouteLinks.game.path,
  );
  static final List<GoRoute> _routes = [
    GoRoute(
      path: RouteLinks.game.path,
      name: RouteLinks.game.path,
      builder: (context, state) => const GamePage(),
    ),
  ];
}
