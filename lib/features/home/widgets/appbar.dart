import 'package:app/core/extensions/extensions.dart';
import 'package:app/app/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return FHeader.nested(
      title: Text(context.l10n.home),
      titleAlignment: .centerLeft,
      prefixes: [Icon(FLucideIcons.home)],
      suffixes: [
        switch (theme.colors.brightness) {
          .light => FButton.icon(
            onPress: () {
              context.read<ThemeCubit>().setThemeMode(.dark);
            },
            child: Icon(FLucideIcons.sun),
          ),
          .dark => FButton.icon(
            onPress: () {
              context.read<ThemeCubit>().setThemeMode(.light);
            },
            child: Icon(FLucideIcons.moon),
          ),
        },
        SizedBox(width: 8),
        FButton.icon(
          onPress: () {
            context.read<LocaleCubit>().nextLocale();
          },
          child: Icon(Icons.language),
        ),
      ],
    );
  }
}
