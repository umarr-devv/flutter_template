import 'package:app/core/extensions/extensions.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class MenuBottomBar extends StatefulWidget {
  const MenuBottomBar(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<MenuBottomBar> createState() => _MenuBottomBarState();
}

class _MenuBottomBarState extends State<MenuBottomBar> {
  List<FBottomNavigationBarItem> get items => [
    FBottomNavigationBarItem(
      icon: Icon(FLucideIcons.house),
      label: Text(context.l10n.home),
    ),
    FBottomNavigationBarItem(
      icon: Icon(FLucideIcons.search),
      label: Text(context.l10n.search),
    ),
    FBottomNavigationBarItem(
      icon: Icon(FLucideIcons.heart),
      label: Text(context.l10n.favorite),
    ),
    FBottomNavigationBarItem(
      icon: Icon(FLucideIcons.userRound),
      label: Text(context.l10n.profile),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FBottomNavigationBar(
      index: widget.navigationShell.currentIndex,
      onChange: (value) {
        widget.navigationShell.goBranch(
          value,
          initialLocation: value == widget.navigationShell.currentIndex,
        );
      },
      children: items,
    );
  }
}
