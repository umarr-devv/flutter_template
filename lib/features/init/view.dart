import 'package:app/core/router/router.dart';
import 'package:app/features/init/bloc/init_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final bloc = InitBloc();

  @override
  void initState() {
    bloc.add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitBloc, InitState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is InitLoaded) {
          AutoRouter.of(
            context,
          ).pushAndPopUntil(MenuRoute(), predicate: (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4,
                  width: 96,
                  child: LinearProgressIndicator(
                    minHeight: 4,
                    value: state.progress,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Text('${(state.progress * 100).toStringAsFixed(0)}%'),
              ],
            ),
          ),
        );
      },
    );
  }
}
