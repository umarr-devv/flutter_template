import 'package:app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(title: Text(context.l10n.search));
  }
}
