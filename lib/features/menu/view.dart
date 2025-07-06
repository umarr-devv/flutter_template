import 'package:app/core/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:app/features/menu/widgets/widgets.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [HomeRoute(), SearchRoute(), FavoriteRoute(), SettingsRoute()],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: MenuNavigatorBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
