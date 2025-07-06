import 'package:app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 200,
      toolbarHeight: 64,
      pinned: true,
      floating: true,
      snap: true,
      backgroundColor: theme.custom.primaryBackground,
      surfaceTintColor: theme.custom.primaryBackground,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(),
        title: Text('Главная'),
        centerTitle: true,
      ),
      elevation: 8,
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      ],
    );
  }
}
