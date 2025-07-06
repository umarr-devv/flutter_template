import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final List<double> progressSteos = [0, 0.1, 0.3, 0.5, 0.7, 0.9, 1.0];
  final delay = const Duration(milliseconds: 500);

  final talker = GetIt.I<Talker>();

  InitBloc() : super(InitInitial(const InitState())) {
    on<InitEvent>((event, emit) async {
      try {
        for (final step in progressSteos) {
          await Future.delayed(delay);
          emit(InitLoading(state.copyWith(progress: step)));
        }
        emit(InitLoaded(state.copyWith(progress: 1)));
      } catch (exc) {
        talker.error(exc);
        emit(InitFailure(state.copyWith(progress: 0)));
      }
    });
  }
}
