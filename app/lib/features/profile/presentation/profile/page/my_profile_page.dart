import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/app_images.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  static const String routerPath = 'my';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Profile'),
      body: ListView(
        padding: context.insets.a16,
        children: <Widget>[
          Center(
            child: SizedBox.square(
              dimension: 100,
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
                          borderRadius: BorderRadius.circular(context.sizes.p8),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: context.sizes.p16,
                          color: context.colorScheme.onPrimary,
                        )),
                  ),
                ],
              ),
            ),
          ),
          TextFormField(
            initialValue: 'Long',
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p16),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: context.colorScheme.secondaryContainer,
              hintText: context.l10n.full_name,
              hintStyle: context.typo.labelLarge,
            ),
          ),
          TextFormField(
            initialValue: 'Truong Nhat',
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p16),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: context.colorScheme.secondaryContainer,
              hintText: context.l10n.full_name,
              hintStyle: context.typo.labelLarge,
            ),
          ),
          TextFormField(
            initialValue: DateFormat.yMd().format(DateTime(2000, 3, 21)),
            readOnly: true,
            onTap: () {
              context.showCupertinoDialog<DateTime?>(
                dialogHeight: context.sizes.p4 * 80,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoDatePicker(
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDate) {},
                      ),
                    ),
                    AppElevatedButton(
                        child: Text(context.l10n.confirm), onPressed: () {}),
                    AppOutlinedButton(
                        primary: context.colorScheme.onSecondaryContainer,
                        child: Text(context.l10n.cancel),
                        onPressed: () {}),
                  ].applySeparator(context.gaps.h8),
                ),
              );
            },
            decoration: InputDecoration(
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p16),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: context.colorScheme.secondaryContainer,
              hintText: context.l10n.birthday,
              hintStyle: context.typo.labelLarge,
              suffixIcon: const Icon(Icons.calendar_month),
            ),
          ),
          TextFormField(
            initialValue: 'Male',
            readOnly: true,
            onTap: () {
              context.showCupertinoDialog<DateTime?>(
                dialogHeight: context.sizes.p4 * 80,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: context.sizes.p40,
                        onSelectedItemChanged: (int selectedItem) {},
                        children: <Text>[
                          Text(context.l10n.male,
                              style: context.typo.titleLarge),
                          Text(context.l10n.female,
                              style: context.typo.titleLarge),
                          Text(context.l10n.other,
                              style: context.typo.titleLarge),
                        ],
                      ),
                    ),
                    AppElevatedButton(
                        dense: false,
                        child: Text(context.l10n.confirm),
                        onPressed: () {}),
                    AppOutlinedButton(
                        dense: false,
                        primary: context.colorScheme.onSecondaryContainer,
                        child: Text(context.l10n.cancel),
                        onPressed: () {}),
                  ].applySeparator(context.gaps.h8),
                ),
              );
            },
            decoration: InputDecoration(
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p16),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: context.colorScheme.secondaryContainer,
              hintText: context.l10n.gender,
              hintStyle: context.typo.labelLarge,
              suffixIcon: const Icon(Icons.expand_more),
            ),
          ),
          TextFormField(
            initialValue: '+84 34 4325 820',
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: context.insets.h16,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(context.sizes.p16),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: context.colorScheme.secondaryContainer,
                hintText: context.l10n.phone_number,
                hintStyle: context.typo.labelLarge,
                prefixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(AppImages.flagVietName,
                        width: context.sizes.p40),
                    const Icon(Icons.expand_more),
                  ],
                ),
                prefixIconConstraints: BoxConstraints.tightFor(
                  width: context.sizes.p72,
                )),
          ),
          TextFormField(
            initialValue: 'Viet Nam',
            readOnly: true,
            onTap: () {
              context.showCupertinoDialog<DateTime?>(
                dialogHeight: context.sizes.p4 * 80,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: context.sizes.p40,
                        onSelectedItemChanged: (int selectedItem) {},
                        children: <Text>[
                          Text(context.l10n.vietnam,
                              style: context.typo.titleLarge),
                          Text(context.l10n.united_states,
                              style: context.typo.titleLarge),
                          Text(context.l10n.other,
                              style: context.typo.titleLarge),
                        ],
                      ),
                    ),
                    AppElevatedButton(
                        dense: false,
                        child: Text(context.l10n.confirm),
                        onPressed: () {}),
                    AppOutlinedButton(
                        dense: false,
                        primary: context.colorScheme.onSecondaryContainer,
                        child: Text(context.l10n.cancel),
                        onPressed: () {}),
                  ].applySeparator(context.gaps.h8),
                ),
              );
            },
            decoration: InputDecoration(
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p16),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: context.colorScheme.secondaryContainer,
              hintText: context.l10n.nationality,
              hintStyle: context.typo.labelLarge,
              suffixIcon: const Icon(Icons.expand_more),
            ),
          ),
        ].applySeparator(context.gaps.h24),
      ),
      bottomNavigationBar: Padding(
        padding: context.insets.a16,
        child: AppElevatedButton(
          dense: false,
          borderRadius: BorderRadius.circular(context.sizes.p40),
          child: Text(context.l10n.update),
          onPressed: () {},
        ),
      ),
    );
  }
}
