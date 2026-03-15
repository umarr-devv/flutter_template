import 'package:app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(title: Text(context.l10n.profile));
  }
}
