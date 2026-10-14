import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCubit extends Cubit<List<ConnectivityResult>> {
  ConnectivityCubit() : super([]) {
    init();
  }

  final connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>>? subscription;

  Future init() async {
    final result = await connectivity.checkConnectivity();
    emit(result);
    subscription = connectivity.onConnectivityChanged.listen((results) {
      emit(results);
    });
  }

  bool isConnected() {
    return state.any((i) => i != ConnectivityResult.none);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
