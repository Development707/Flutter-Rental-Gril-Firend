import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_language_state.dart';
part 'profile_language_cubit.freezed.dart';

class ProfileLanguageCubit extends Cubit<ProfileLanguageState> {
  ProfileLanguageCubit() : super(const ProfileLanguageState.initial());
}
