import 'package:app/features/favorite/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [FavoriteAppBar()]);
  }
}
