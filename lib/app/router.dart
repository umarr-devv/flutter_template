import 'package:app/features/detail/detail.dart';
import 'package:app/features/favorite/favorite.dart';
import 'package:app/features/home/home.dart';
import 'package:app/features/profile/profile.dart';
import 'package:app/features/search/search.dart';
import 'package:app/shared/wrappers/menu_wrapper.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  observers: [TalkerRouteObserver(GetIt.I<Talker>())],
  routes: [
    GoRoute(
      path: '/logs',
      builder: (context, state) => TalkerScreen(talker: GetIt.I<Talker>()),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MenuWrapper(navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
            GoRoute(
              path: '/detail',
              builder: (context, state) => DetailScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorite',
              builder: (context, state) => FavoriteScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
