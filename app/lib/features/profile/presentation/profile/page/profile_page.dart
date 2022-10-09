import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/service/app_service.dart';
import '../../../../../config/dependency_container.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../../../../authentication/authentication.dart';
import '../../../../help_center/help_center.dart';
import '../../../../notification/notification.dart';
import '../../../../settings/settings.dart';
import '../../../profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(AppImages.icProd, height: context.sizes.p40),
            context.gaps.w8,
            Text(context.l10n.profile),
          ],
        ),
        titleTextStyle: context.typo.headlineSmall.weight600.copyWith(
          color: context.colorScheme.onBackground,
        ),
        actions: <Widget>[
          Icon(Icons.more_horiz, size: context.sizes.p32),
          context.gaps.w16,
        ],
      ),
      body: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (BuildContext context, AppSettingsState state) {
          final String lang =
              state.locale.languageCode == 'vi' ? 'Tiếng Việt' : 'English';
          final String mode = state.themeMode == ThemeMode.system
              ? context.l10n.system
              : state.themeMode == ThemeMode.light
                  ? context.l10n.light
                  : context.l10n.dark;

          return ListView(
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              Center(
                child: SizedBox.square(
                  dimension: 120,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: <Widget>[
                      const RoundedImage(size: double.infinity),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: context.insets.a4,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              borderRadius:
                                  BorderRadius.circular(context.sizes.p8),
                            ),
                            child: Icon(
                              Icons.edit,
                              size: context.sizes.p24,
                              color: context.colorScheme.onPrimary,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              context.gaps.h16,
              Center(
                child: Text(context.l10n.full_name,
                    style: context.typo.headlineSmall.weight700),
              ),
              Divider(
                thickness: 1,
                color: context.colorScheme.outline.withOpacity(0.3),
                indent: context.sizes.p16,
                endIndent: context.sizes.p16,
                height: context.sizes.p32,
              ),
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${ProfileMyBookingPage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.calendar_month_outlined,
                        size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.my_booking,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${ProfilePaymentsPage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.payments_outlined, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.payments,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              Divider(
                thickness: 1,
                color: context.colorScheme.outline.withOpacity(0.3),
                indent: context.sizes.p16,
                endIndent: context.sizes.p16,
                height: context.sizes.p32,
              ),
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${MyProfilePage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.person_outline, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.profile,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${NotificationPage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.notifications_outlined, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.notification,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${SettingSecurityPage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.verified_user_outlined, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.security,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${SettingLanguagePage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.translate, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.language,
                            style: context.typo.titleMedium)),
                    Text(lang, style: context.typo.titleMedium),
                    context.gaps.w8,
                    Icon(Icons.navigate_next, size: context.sizes.p32),
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${SettingThemeModePage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.settings_brightness, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.dark_mode,
                            style: context.typo.titleMedium)),
                    Text(mode, style: context.typo.titleMedium),
                    context.gaps.w8,
                    Icon(Icons.navigate_next, size: context.sizes.p32),
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${HelpCenterPage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.help_outline, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.help_center,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () {
                  context.goRouter.go(
                      '${context.goRouter.location}/${ProfileImviteFriendPage.routerPath}');
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(Icons.group_add_outlined, size: context.sizes.p32),
                    context.gaps.w12,
                    Expanded(
                        child: Text(context.l10n.invite_firend,
                            style: context.typo.titleMedium)),
                    Icon(Icons.navigate_next, size: context.sizes.p32)
                  ]),
                ),
              ),
              context.gaps.h16,
              Bounceable(
                onTap: () async {
                  final bool isLogout = await context.showWarnigDialog(
                    title: Text(context.l10n.log_out),
                    content: Text(context.l10n.log_out_confirmation),
                  );

                  if (isLogout) {
                    getIt<AuthenticationBloc>()
                        .add(const AuthenticationEvent.loggedOut());
                  }
                },
                child: Padding(
                  padding: context.insets.h16,
                  child: Row(children: <Widget>[
                    Icon(
                      Icons.logout,
                      size: context.sizes.p32,
                      color: context.colorScheme.error,
                    ),
                    context.gaps.w12,
                    Text(context.l10n.log_out,
                        style: context.typo.titleMedium.copyWith(
                          color: context.colorScheme.error,
                        )),
                  ]),
                ),
              ),
              context.gaps.h16,
            ],
          );
        },
      ),
    );
  }
}
