import 'package:app/features/favorite/view.dart';
import 'package:app/features/home/view.dart';
import 'package:app/features/init/view.dart';
import 'package:app/features/menu/view.dart';
import 'package:app/features/search/view.dart';
import 'package:app/features/settings/view.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: InitRoute.page, initial: true),
    CustomRoute(
      page: MenuRoute.page,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
