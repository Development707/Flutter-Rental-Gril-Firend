import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/dependency_container.dart';
import '../../../authentication.dart';
import '../../../domain/user.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : _authBloc = getIt(),
        super(const LoginState.initial());

  final AuthenticationBloc _authBloc;

  void login() {
    emit(const LoginState.loading());
    _authBloc.add(const AuthenticationEvent.saveToken('token'));
    _authBloc.add(const AuthenticationEvent.loggedIn(User(id: 1)));
    emit(const LoginState.success());
  }
}
