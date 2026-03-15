import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,

        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: SvgIcon('assets/svg/house.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon('assets/svg/search.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon('assets/svg/heart.svg'),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon('assets/svg/user.svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
