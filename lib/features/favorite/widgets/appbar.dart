import 'package:app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FavoriteAppBar extends StatelessWidget {
  const FavoriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(title: Text(context.l10n.favorite));
  }
}
