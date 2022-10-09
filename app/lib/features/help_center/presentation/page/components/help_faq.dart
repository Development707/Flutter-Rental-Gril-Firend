import 'package:flutter/material.dart';

import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class HelpFaq extends StatelessWidget {
  const HelpFaq({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(children: <Widget>[
        SizedBox(
          height: context.sizes.p56,
          child: ListView(
            padding: context.insets.h16,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              AppFilterChip(
                selected: true,
                label: Text(context.l10n.general),
                onSelected: (_) {},
              ),
              AppFilterChip(
                label: Text(context.l10n.account),
                onSelected: (_) {},
              ),
              AppFilterChip(
                label: Text(context.l10n.service),
                onSelected: (_) {},
              ),
              AppFilterChip(
                label: Text(context.l10n.payments),
                onSelected: (_) {},
              ),
              AppFilterChip(
                label: Text(context.l10n.other),
                onSelected: (_) {},
              ),
              AppFilterChip(
                label: Text(context.l10n.account),
                onSelected: (_) {},
              ),
            ].applySeparator(context.gaps.w8),
          ),
        ),
        context.gaps.h4,
        Padding(
          padding: context.insets.h16,
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p12),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: context.colorScheme.secondaryContainer,
              focusColor: context.colorScheme.primary,
              hoverColor: context.colorScheme.primary,
              prefixIcon: const Icon(Icons.search),
              hintText: context.l10n.search,
              suffixIcon: const Icon(Icons.tune),
            ),
          ),
        ),
        context.gaps.h4,
        Expanded(
          child: ListView.builder(
              padding: context.insets.a16,
              itemBuilder: (BuildContext context, int index) => Container(
                    margin: context.insets.v8,
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(context.sizes.p12),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 10,
                            color:
                                context.colorScheme.outline.withOpacity(0.12)),
                        BoxShadow(
                            offset: const Offset(0, 20),
                            blurRadius: 130,
                            color:
                                context.colorScheme.outline.withOpacity(0.03)),
                      ],
                    ),
                    child: ExpansionTile(
                      title: Text(
                        'ExpansionTile class $index',
                        style: context.typo.titleMedium.weight600,
                      ),
                      tilePadding: context.insets.h16,
                      expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding: context.insets.h16
                          .add(EdgeInsets.only(bottom: context.sizes.p16)),
                      children: <Widget>[
                        Divider(
                          color: context.colorScheme.outline.withOpacity(0.3),
                          thickness: 1,
                          height: 1,
                        ),
                        context.gaps.h8,
                        const Text(
                            'This widget is typically used with ListView to create an "expand / collapse" list entry. When used with scrolling widgets like ListView, a unique PageStorageKey must be specified to enable the ExpansionTile to save and restore its expanded state when it is scrolled in and out of view.'),
                      ],
                    ),
                  )),
        )
      ]),
    );
  }
}
