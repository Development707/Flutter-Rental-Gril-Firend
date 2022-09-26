import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_connect_state.dart';
part 'app_connect_cubit.freezed.dart';

class AppConnectCubit extends Cubit<AppConnectState> {
  AppConnectCubit() : super(const AppConnectState.connected()) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      /* if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(OnConnectedEvent());
      } else {
        add(OnNotConnectedEvent());
      } */
      if (result == ConnectivityResult.none) {
        emit(const AppConnectState.disconnected());
      }
    });
  }
}
