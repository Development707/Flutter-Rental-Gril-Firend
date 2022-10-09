import 'package:flutter/material.dart';

import '../../../../../shared/common/common.dart';
import '../../../../../shared/widgets/widgets.dart';

class ProfileImviteFriendPage extends StatelessWidget {
  const ProfileImviteFriendPage({super.key});

  static const String routerPath = 'invite-friend';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: context.l10n.invite_firend),
      body: ListView.builder(
        padding: context.insets.a16,
        itemBuilder: (BuildContext context, int index) => BaseCard(
          padding: context.insets.v8,
          decoration: const BoxDecoration(),
          leading: const RoundedImage(),
          leadingGap: context.sizes.p8,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name Friend $index',
                  style: context.typo.titleMedium.weight600),
              Text('+84 344325820', style: context.typo.bodyMedium),
            ],
          ),
          trailing: AppElevatedButton(
            borderRadius: BorderRadius.circular(context.sizes.p40),
            expandedWith: false,
            child: Text(context.l10n.invite),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
