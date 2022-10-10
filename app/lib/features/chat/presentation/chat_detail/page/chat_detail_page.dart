import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';
import 'components/friend_message.dart';
import 'components/input_field.dart';
import 'components/my_message.dart';
import 'components/retal_message.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  static const String routerPath = 'detail';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          centerTitle: false,
          titleText: 'Truong Nhat Long',
          actions: <Widget>[
            AppIcon(
              AppIcons.icCall,
              color: context.colorScheme.onBackground,
              size: context.sizes.p32,
            ),
            context.gaps.w12,
            AppIcon(
              AppIcons.icCamRecord,
              color: context.colorScheme.onBackground,
              size: context.sizes.p32,
            ),
            context.gaps.w12,
            Icon(Icons.more_horiz, size: context.sizes.p32),
            context.gaps.w16,
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView(
                padding: context.insets.a16,
                reverse: true,
                shrinkWrap: true,
                children: const <Widget>[
                  MyMessage(),
                  FriendMessage(),
                  RentalMessage(),
                ],
              )),
              Padding(
                padding: context.insets.a8.add(context.insets.h8),
                child: const InputField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
