part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.home() = _Home;
  const factory AppState.login() = _Login;
}
