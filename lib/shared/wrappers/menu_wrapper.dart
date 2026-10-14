import 'package:app/shared/shared.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class MenuWrapper extends StatelessWidget {
  const MenuWrapper(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: .transparency,
      child: FScaffold(
        childPad: false,
        footer: MenuBottomBar(navigationShell),
        child: navigationShell,
      ),
    );
  }
}
