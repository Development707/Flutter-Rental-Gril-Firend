import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_security_state.dart';
part 'profile_security_cubit.freezed.dart';

class ProfileSecurityCubit extends Cubit<ProfileSecurityState> {
  ProfileSecurityCubit() : super(const ProfileSecurityState.initial());
}
