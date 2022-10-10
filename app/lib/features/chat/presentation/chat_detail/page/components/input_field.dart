import 'package:flutter/material.dart';

import '../../../../../../shared/common/common.dart';
import '../../../../../../shared/widgets/widgets.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              filled: true,
              fillColor: context.colorScheme.outline.withOpacity(0.2),
              contentPadding: context.insets.h16,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.sizes.p16),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.mood_outlined,
                size: context.sizes.p32,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Bounceable(
                    onTap: () {
                      context.showCupertinoDialog(
                        child: const AttackFileDialog(),
                      );
                    },
                    child: Padding(
                      padding: context.insets.a8,
                      child: Icon(
                        Icons.attach_file_outlined,
                        size: context.sizes.p32,
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () {},
                    child: Padding(
                      padding: context.insets.a8,
                      child: Icon(
                        Icons.photo_camera_outlined,
                        size: context.sizes.p32,
                      ),
                    ),
                  ),
                ],
              ),
              suffixIconConstraints: const BoxConstraints.tightFor(width: 80),
            ),
          ),
        ),
        context.gaps.w16,
        Container(
            padding: context.insets.a12,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.mic,
              size: context.sizes.p32,
              color: context.colorScheme.onPrimary,
            )),
      ],
    );
  }
}

class AttackFileDialog extends StatelessWidget {
  const AttackFileDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      textStyle: context.typo.titleMedium.weight500.copyWith(
        color: context.colorScheme.onBackground,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: context.insets.a16,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[200],
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.file_copy_outlined,
                          color: context.colorScheme.onPrimary,
                          size: context.sizes.p40,
                        ),
                      ),
                      Text(context.l10n.document),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: context.insets.a16,
                        decoration: BoxDecoration(
                            color: Colors.redAccent[200],
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.photo_camera,
                          color: context.colorScheme.onPrimary,
                          size: context.sizes.p40,
                        ),
                      ),
                      Text(context.l10n.camera),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: context.insets.a16,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent[200],
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.file_copy_outlined,
                          color: context.colorScheme.onPrimary,
                          size: context.sizes.p40,
                        ),
                      ),
                      Text(context.l10n.gallery),
                    ],
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: context.insets.a16,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[200],
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.file_copy_outlined,
                          color: context.colorScheme.onPrimary,
                          size: context.sizes.p40,
                        ),
                      ),
                      Text(context.l10n.audio),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: context.insets.a16,
                        decoration: BoxDecoration(
                            color: Colors.green[200], shape: BoxShape.circle),
                        child: Icon(
                          Icons.near_me,
                          color: context.colorScheme.onPrimary,
                          size: context.sizes.p40,
                        ),
                      ),
                      Text(context.l10n.location),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: context.insets.a16,
                        decoration: BoxDecoration(
                            color: Colors.purple[200], shape: BoxShape.circle),
                        child: Icon(
                          Icons.person_outline,
                          color: context.colorScheme.onPrimary,
                          size: context.sizes.p40,
                        ),
                      ),
                      Text(context.l10n.contacts),
                    ],
                  ),
                ]),
          ]),
    );
  }
}
