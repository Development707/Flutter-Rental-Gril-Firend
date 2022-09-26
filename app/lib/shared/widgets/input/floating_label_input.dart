import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_icons.dart';
import '../../common/common.dart';
import '../app_icon.dart';

class FloatingLabelInput extends StatefulWidget {
  const FloatingLabelInput({
    super.key,
    this.hintText,
    required this.labelText,
    required this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.icon,
    this.obscureText = false,
    this.showHiddenInput,
    this.keyboardType,
    this.textInputAction,
    this.border,
    this.inputFormatters,
  });

  final String? icon;
  final String? hintText;
  final String labelText;
  final bool obscureText;
  final String? errorText;
  final VoidCallback? showHiddenInput;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputBorder? border;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<FloatingLabelInput> createState() => _FloatingLabelInputState();
}

class _FloatingLabelInputState extends State<FloatingLabelInput> {
  String textBeingTyped = '';
  bool showErrorTooltip = false;
  late bool obscureText;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  bool get inputIsFilled => textBeingTyped.isNotEmpty;
  bool get inputIsInvalid => widget.errorText != null;

  void _remember(String text) {
    setState(
      () {
        textBeingTyped = text;
      },
    );
  }

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {
      showErrorTooltip = !_focusNode.hasFocus;
    });
  }

  void showHidenInput() {
    setState(() => obscureText = !obscureText);
    if (widget.showHiddenInput != null) {
      widget.showHiddenInput!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onSubmitted: widget.onSubmitted,
      onChanged: (String str) {
        if (widget.onChanged != null) {
          widget.onChanged!(str);
        }
        _remember(str);
      },
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: obscureText,
      obscuringCharacter: '*',
      textInputAction: widget.textInputAction,
      style: context.typo.bodyLarge,
      cursorColor: context.colorScheme.primary,
      cursorRadius: const Radius.circular(29),
      decoration: InputDecoration(
        fillColor: context.colors.primary100,
        hintText: widget.hintText,
        errorText: inputIsFilled && inputIsInvalid && _focusNode.hasFocus
            ? widget.errorText
            : null,
        hintStyle: context.typo.titleSmall
            .copyWith(color: context.colorScheme.primary),
        label: widget.icon != null
            ? Row(
                children: <Widget>[
                  AppIcon(widget.icon!, color: context.colors.neuTral80),
                  context.gaps.gapW12,
                  Text(
                    widget.labelText,
                    style: context.typo.titleSmall.copyWith(
                      color: context.colors.neuTral80,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : null,
        labelStyle: context.typo.headlineLarge,
        suffix: (widget.showHiddenInput != null)
            ? GestureDetector(
                onTap: showHidenInput,
                child: AppIcon(
                  obscureText ? AppIcons.icEye : AppIcons.icEyeSlash,
                  color: context.colors.neuTral80,
                ),
              )
            : null,
        border: widget.border,
        enabledBorder: widget.border,
      ),
    );
  }
}
