import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../app/service/app_service.dart';
import '../../../../../../shared/common/common.dart';
import '../../../../../../shared/widgets/widgets.dart';

class RentalMessage extends StatelessWidget {
  const RentalMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Locale localeApp = context.read<AppSettingsCubit>().state.locale;
    final NumberFormat currency = NumberFormat.compactSimpleCurrency(
      locale: localeApp.toString(),
    );

    return Align(
      child: BaseCard(
        margin: context.insets.a8,
        leading: Stack(
          children: [
            RoundedRectImage(
              width: context.sizes.p4 * 30,
              height: context.sizes.p4 * 25,
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
                  Icon(Icons.star,
                      size: context.sizes.p8, color: Colors.orange),
                  Text('4.8',
                      style: context.typo.labelSmall.copyWith(
                        color: context.colorScheme.onTertiaryContainer,
                      )),
                ]),
              ),
            ),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dễ Thương Nhất Trên Trái Đất',
              style: context.typo.titleLarge.weight600.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
            ),
            Text('Hồng Cách Cách', style: context.typo.bodyMedium)
          ],
        ),
        trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.favorite_outline,
                size: context.sizes.p32,
                color: context.colorScheme.primary,
              ),
              context.gaps.h16,
              Text(currency.format(150),
                  style: context.typo.titleLarge.weight600.copyWith(
                    color: context.colorScheme.primary,
                  )),
            ]),
      ),
    );
  }
}
