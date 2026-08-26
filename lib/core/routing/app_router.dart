import 'package:app/core/routing/routings.dart';
import 'package:app/features/init/init.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/init',
    observers: [TalkerRouteObserver(GetIt.I<Talker>())],
    routes: [
      GoRoute(
        path: '/logs',
        name: Routings.logs.name,
        builder: (context, state) => TalkerScreen(talker: GetIt.I<Talker>()),
      ),
      GoRoute(
        path: '/init',
        name: Routings.init.name,
        builder: (context, state) => InitScreen(),
      ),
    ],
  );
}
