part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.updateState(AppState state) = _UpdateState;
}
