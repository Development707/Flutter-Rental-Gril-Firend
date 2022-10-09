import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/service/app_service.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class SettingThemeModePage extends StatelessWidget {
  const SettingThemeModePage({super.key});

  static const String routerPath = 'theme-mode';

  @override
  Widget build(BuildContext context) {
    final AppSettingsCubit setting = context.read<AppSettingsCubit>();

    return Scaffold(
      appBar: CustomAppBar(titleText: context.l10n.dark_mode),
      body: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (BuildContext context, AppSettingsState state) {
          return ListView(
            padding: context.insets.a16,
            children: <Widget>[
              AppRadioListTile<ThemeMode>(
                  title:
                      Text(context.l10n.system, style: context.typo.titleLarge),
                  value: ThemeMode.system,
                  groupValue: state.themeMode,
                  onChanged: setting.changeThemeMode),
              AppRadioListTile<ThemeMode>(
                  title:
                      Text(context.l10n.light, style: context.typo.titleLarge),
                  value: ThemeMode.light,
                  groupValue: state.themeMode,
                  onChanged: setting.changeThemeMode),
              AppRadioListTile<ThemeMode>(
                  title:
                      Text(context.l10n.dark, style: context.typo.titleLarge),
                  value: ThemeMode.dark,
                  groupValue: state.themeMode,
                  onChanged: setting.changeThemeMode),
            ].applySeparator(context.gaps.h4),
          );
        },
      ),
    );
  }
}
