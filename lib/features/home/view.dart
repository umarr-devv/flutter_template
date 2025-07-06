import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:app/features/home/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [HomeAppBar(), SliverFillRemaining()]),
    );
  }
}
