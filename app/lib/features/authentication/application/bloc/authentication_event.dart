part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.init() = _Initial;
  const factory AuthenticationEvent.loggedIn(User user) = _LoggedIn;
  const factory AuthenticationEvent.loggedOut() = _LoggedOut;
  const factory AuthenticationEvent.saveToken(String token) = _SaveToken;
}
