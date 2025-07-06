import 'package:app/shared/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _NavigationItem {
  const _NavigationItem({required this.icon, required this.label});

  final String icon;
  final String label;
}

class MenuNavigatorBar extends StatefulWidget {
  const MenuNavigatorBar({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  @override
  State<MenuNavigatorBar> createState() => _MenuNavigatorBarState();
}

class _MenuNavigatorBarState extends State<MenuNavigatorBar> {
  final List<_NavigationItem> _items = [
    _NavigationItem(icon: 'assets/svg/home.svg', label: 'Home'),
    _NavigationItem(icon: 'assets/svg/search.svg', label: 'Search'),
    _NavigationItem(icon: 'assets/svg/favorite.svg', label: 'Favorites'),
    _NavigationItem(icon: 'assets/svg/settings.svg', label: 'Settings'),
  ];

  List<BottomNavigationBarItem> get items {
    final theme = Theme.of(context);
    return _items.map((item) {
      final active = _items.indexOf(item) == widget.tabsRouter.activeIndex;
      return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          item.icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            active
                ? theme.custom.primaryColor
                : theme.custom.secondaryForeground,
            BlendMode.srcIn,
          ),
        ),
        label: item.label,
      );
    }).toList();
  }

  void onTap(int index) {
    if (index != widget.tabsRouter.activeIndex) {
      widget.tabsRouter.setActiveIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.tabsRouter.activeIndex,
      onTap: onTap,
      items: items,
    );
  }
}
