import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/theme/theme.dart';

part 'app_settings_state.dart';
part 'app_settings_cubit.freezed.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit()
      : super(const AppSettingsState.settings(
          themeMode: ThemeMode.light,
          themeDataContainer: ThemeDataContainer(),
          locale: Locale('vi', 'VN'),
        )) {
    // Get local data

    // Change settings
    changeThemeMode(ThemeMode.system);
    changeLocale(SchedulerBinding.instance.window.locale);
  }

  static const Locale viLanguage = Locale('vi', 'VN');
  static const Locale enLanguage = Locale('en', 'US');

  void changeThemeMode(ThemeMode? themeMode) {
    if (themeMode != null && themeMode != state.themeMode) {
      emit(state.copyWith(themeMode: themeMode));
    }
  }

  void changeThemeDataContainer(ThemeDataContainer theme) {
    emit(state.copyWith(themeDataContainer: theme));
  }

  void changeLocale(Locale? locale) {
    if (locale != null && locale != state.locale) {
      emit(state.copyWith(
        locale: locale.languageCode == 'vi' ? viLanguage : enLanguage,
      ));
    }
  }
}
