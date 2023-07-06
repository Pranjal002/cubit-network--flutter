import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? connectivitySubscription;
  Connectivity _connectivity = Connectivity();

  InternetCubit() : super(InternetInitial()) {
    connectivitySubscription= _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetGained());
      } else {
        emit(InternetLost());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
