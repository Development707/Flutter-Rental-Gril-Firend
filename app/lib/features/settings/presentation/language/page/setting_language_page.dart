import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/service/app_service.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class SettingLanguagePage extends StatelessWidget {
  const SettingLanguagePage({super.key});

  static const String routerPath = 'language';

  @override
  Widget build(BuildContext context) {
    final List<String> languages = <String>[
      'Mandarin Chinese',
      'Spanish',
      'Hindi',
      'Bengali',
      'Russian',
      'Japanese',
      'Yue Chinese',
      'Marathi',
      'Telugu',
      'Korean',
      'French',
      'German',
      'Italian',
      'Thai',
      'Indonesian',
    ];
    final AppSettingsCubit setting = context.read<AppSettingsCubit>();

    return Scaffold(
      appBar: CustomAppBar(titleText: context.l10n.language),
      body: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (BuildContext context, AppSettingsState state) {
          return ListView(
            padding: context.insets.a16,
            children: <Widget>[
              Text(context.l10n.suggested,
                  style: context.typo.headlineSmall.weight600),
              context.gaps.h4,
              AppRadioListTile<Locale>(
                  title: Text('English', style: context.typo.titleLarge),
                  value: AppSettingsCubit.enLanguage,
                  groupValue: state.locale,
                  onChanged: setting.changeLocale),
              AppRadioListTile<Locale>(
                  title: Text('Tiếng Việt', style: context.typo.titleLarge),
                  value: AppSettingsCubit.viLanguage,
                  groupValue: state.locale,
                  onChanged: setting.changeLocale),
              Divider(
                thickness: 1,
                color: context.colorScheme.outline.withOpacity(0.3),
                height: context.sizes.p40,
              ),
              Text(context.l10n.language,
                  style: context.typo.headlineSmall.weight600),
              context.gaps.h24,
              ...languages
                  .map((String lang) => Row(children: <Widget>[
                        Expanded(
                            child: Text(lang, style: context.typo.titleLarge)),
                        AppRadio<String>(
                            value: '', groupValue: lang, onChanged: (_) {}),
                      ]))
                  .applySeparator(context.gaps.h16)
            ],
          );
        },
      ),
    );
  }
}
