import 'package:app/core/routing/routings.dart';
import 'package:app/features/favorite/favorite_screen.dart';
import 'package:app/features/home/home_screen.dart';
import 'package:app/features/profile/profile_screen.dart';
import 'package:app/features/search/search_screen.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    observers: [TalkerRouteObserver(GetIt.I<Talker>())],
    routes: [
      GoRoute(
        path: '/logs',
        name: Routings.logs.name,
        builder: (context, state) => TalkerScreen(talker: GetIt.I<Talker>()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CustomNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: Routings.home.name,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: Routings.search.name,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorite',
                name: Routings.favorite.name,
                builder: (context, state) => const FavoriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: Routings.profile.name,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
