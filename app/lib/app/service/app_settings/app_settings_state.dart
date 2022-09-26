part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState.settings({
    required ThemeMode themeMode,
    required ThemeDataContainer themeDataContainer,
    required Locale locale,
  }) = _Settings;
}
