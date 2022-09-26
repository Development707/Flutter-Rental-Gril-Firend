part of 'app_connect_cubit.dart';

@freezed
class AppConnectState with _$AppConnectState {
  const factory AppConnectState.connected() = _Connected;
  const factory AppConnectState.disconnected() = _Disconnected;
}
