import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/common/common.dart';
import '../../../shared/widgets/widgets.dart';
import '../../authentication/authentication.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppOutlinedButton(
          expandedWith: false,
          child: Text(context.l1On.log_out),
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(const AuthenticationEvent.loggedOut());
          }),
    );
  }
}
