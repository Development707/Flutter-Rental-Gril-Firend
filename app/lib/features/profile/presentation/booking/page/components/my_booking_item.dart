import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../app/service/app_service.dart';
import '../../../../../../shared/common/common.dart';
import '../../../../../../shared/widgets/widgets.dart';

class MyBookingItem extends StatelessWidget {
  const MyBookingItem({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    final Locale localeApp = context.read<AppSettingsCubit>().state.locale;
    final NumberFormat currency = NumberFormat.compactSimpleCurrency(
      locale: localeApp.toString(),
    );

    return BaseCard(
      borderRadius: BorderRadius.circular(context.sizes.p24),
      leading: Stack(
        children: <Widget>[
          RoundedRectImage(
            width: context.sizes.p96,
            height: context.sizes.p96,
            borderRadius: BorderRadius.circular(context.sizes.p24),
          ),
          Positioned(
            right: context.sizes.p8,
            top: context.sizes.p8,
            child: Container(
              padding: context.insets.h8,
              decoration: BoxDecoration(
                color: context.colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(context.sizes.p24),
              ),
              child: Row(children: <Widget>[
                Icon(Icons.star, size: context.sizes.p8, color: Colors.orange),
                Text('4.8',
                    style: context.typo.labelSmall.copyWith(
                      color: context.colorScheme.onTertiaryContainer,
                    )),
              ]),
            ),
          )
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Yuna Ogura', style: context.typo.titleLarge.weight700),
          context.gaps.h8,
          Text(
              '${DateFormat.yMEd().format(dateTime)} (${DateTimeUtils.relative(dateTime)})'),
          context.gaps.h4,
          Row(children: <Widget>[
            Text(currency.format(150),
                style: context.typo.titleLarge.copyWith(
                  color: context.colorScheme.primary,
                )),
            Text(' / 5 ${context.l10n.hours}', style: context.typo.labelSmall),
            context.gaps.w8,
            Container(
                padding: context.insets.h4,
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.primary),
                  borderRadius: BorderRadius.circular(context.sizes.p4),
                ),
                child: Text(context.l10n.paid,
                    style: context.typo.labelSmall.copyWith(
                      color: context.colorScheme.primary,
                    )))
          ]),
        ],
      ),
      bottom: Column(children: <Widget>[
        Divider(color: context.colorScheme.outline.withOpacity(0.3)),
        Row(children: <Widget>[
          Expanded(
              child: AppElevatedButton(
                  borderRadius: BorderRadius.circular(context.sizes.p40),
                  child: Text(context.l10n.detail),
                  onPressed: () {})),
          context.gaps.w16,
          Expanded(
              child: AppOutlinedButton(
                  borderRadius: BorderRadius.circular(context.sizes.p40),
                  child: Text(context.l10n.receipt),
                  onPressed: () {})),
        ])
      ]),
    );
  }
}
