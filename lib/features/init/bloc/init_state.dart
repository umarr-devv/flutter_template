part of 'init_bloc.dart';

class InitState extends Equatable {
  const InitState({this.progress = 0});

  final double progress;

  InitState copyWith({double? progress}) {
    return InitState(progress: progress ?? this.progress);
  }

  InitState.from(InitState other) : progress = other.progress;

  @override
  List<Object?> get props => [progress];
}

final class InitInitial extends InitState {
  InitInitial(super.state) : super.from();
}

final class InitLoading extends InitState {
  InitLoading(super.state) : super.from();
}

final class InitLoaded extends InitState {
  InitLoaded(super.state) : super.from();
}

final class InitFailure extends InitState {
  InitFailure(super.state) : super.from();
}
