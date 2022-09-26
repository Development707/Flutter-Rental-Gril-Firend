import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/authentication/authentication.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AuthenticationBloc authenticationBloc)
      : super(const AppState.initial()) {
    on<_UpdateState>(_onUpdateState);

    // Listen Authen Bloc
    authenticationBloc.stream.listen((AuthenticationState authState) {
      authState.whenOrNull(
        unauthenticated: () =>
            add(const AppEvent.updateState(AppState.login())),
        authenticated: (_) => add(const AppEvent.updateState(AppState.home())),
      );
    });
  }

  FutureOr<void> _onUpdateState(_UpdateState event, Emitter<AppState> emit) {
    emit(event.state);
    FlutterNativeSplash.remove();
  }
}
