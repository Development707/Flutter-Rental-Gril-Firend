import 'package:flutter/material.dart';

import '../../../../../constants/app_icons.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class HelpContactUs extends StatelessWidget {
  const HelpContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.insets.a16,
      children: <Widget>[
        BaseCard(
          padding: context.insets.a16,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(context.sizes.p12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  color: context.colorScheme.outline.withOpacity(0.12)),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 130,
                  color: context.colorScheme.outline.withOpacity(0.03)),
            ],
          ),
          leading: Icon(
            Icons.support_agent,
            size: context.sizes.p32,
            color: context.colorScheme.primary,
          ),
          content: Text(
            context.l10n.customer_service,
            style: context.typo.titleMedium.weight600,
          ),
        ),
        BaseCard(
          padding: context.insets.a16,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(context.sizes.p12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  color: context.colorScheme.outline.withOpacity(0.12)),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 130,
                  color: context.colorScheme.outline.withOpacity(0.03)),
            ],
          ),
          leading: Icon(
            Icons.language,
            size: context.sizes.p32,
            color: context.colorScheme.primary,
          ),
          content: Text(
            'Website',
            style: context.typo.titleMedium.weight600,
          ),
        ),
        BaseCard(
          padding: context.insets.a16,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(context.sizes.p12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  color: context.colorScheme.outline.withOpacity(0.12)),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 130,
                  color: context.colorScheme.outline.withOpacity(0.03)),
            ],
          ),
          leading: Icon(
            Icons.facebook,
            size: context.sizes.p32,
            color: context.colorScheme.primary,
          ),
          content: Text(
            'Facebook',
            style: context.typo.titleMedium.weight600,
          ),
        ),
        BaseCard(
          padding: context.insets.a16,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(context.sizes.p12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  color: context.colorScheme.outline.withOpacity(0.12)),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 130,
                  color: context.colorScheme.outline.withOpacity(0.03)),
            ],
          ),
          leading: AppIcon(
            AppIcons.icTwitter,
            size: context.sizes.p32,
            color: context.colorScheme.primary,
          ),
          content: Text(
            'Twitter',
            style: context.typo.titleMedium.weight600,
          ),
        ),
        BaseCard(
          padding: context.insets.a16,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(context.sizes.p12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  color: context.colorScheme.outline.withOpacity(0.12)),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 130,
                  color: context.colorScheme.outline.withOpacity(0.03)),
            ],
          ),
          leading: AppIcon(
            AppIcons.icInstagram,
            size: context.sizes.p32,
            color: context.colorScheme.primary,
          ),
          content: Text(
            'Instagram',
            style: context.typo.titleMedium.weight600,
          ),
        ),
      ].applySeparator(context.gaps.h16),
    );
  }
}
