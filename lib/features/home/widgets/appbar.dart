import 'package:app/blocs/blocs.dart';
import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/routing/routings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(context.l10n.home),
      actions: [
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().switchTheme();
          },
          icon: Icon(Icons.dark_mode),
        ),
        IconButton(
          onPressed: () {
            final cubit = context.read<LocaleCubit>();
            if (cubit.state.languageCode == 'ru') {
              cubit.setLocale(Locale('en'));
            } else {
              cubit.setLocale(Locale('ru'));
            }
          },
          icon: Icon(Icons.language),
        ),
        IconButton(
          onPressed: () {
            Routings.logs.push(context);
          },
          icon: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
