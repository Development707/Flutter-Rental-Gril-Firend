import 'dart:async';
import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/common/common.dart';
import '../../domain/user.dart';
import '../authentication_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationService authenticationService)
      : _authService = authenticationService,
        super(const AuthenticationState.unauthenticated()) {
    on<_Initial>(_onInitial, transformer: sequential());
    on<_LoggedIn>(_onLoggedIn, transformer: sequential());
    on<_LoggedOut>(_onLoggedOut, transformer: sequential());
    on<_SaveToken>(_onSaveToken, transformer: sequential());
  }

  final AuthenticationService _authService;

  FutureOr<void> _onInitial(
      _Initial event, Emitter<AuthenticationState> emit) async {
    try {
      final String? tokenS = await _authService.getAuthToken();
      final String? userS = await _authService.getUser();

      if (tokenS != null && userS != null) {
        final User user = User.fromJson(jsonDecode(userS) as JSON);
        emit(AuthenticationState.authenticated(user));
      } else {
        _onLoggedOut(null, emit);
      }
    } catch (_) {
      _onLoggedOut(null, emit);
    }
  }

  FutureOr<void> _onLoggedIn(
      _LoggedIn event, Emitter<AuthenticationState> emit) async {
    await _authService.saveUser(jsonEncode(event.user.toJson()));
    emit(AuthenticationState.authenticated(event.user));
  }

  FutureOr<void> _onLoggedOut(
      _LoggedOut? event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.unauthenticated());
    _authService.resetKeys();
  }

  FutureOr<void> _onSaveToken(
      _SaveToken event, Emitter<AuthenticationState> emit) async {
    await _authService.saveAuthToken(event.token);
  }
}
