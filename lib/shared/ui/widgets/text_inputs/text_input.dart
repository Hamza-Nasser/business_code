import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/core/ui_extensions/fade_in_list.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

enum TextInputVariant { standard, obscure }

class UiTextInput extends StatefulWidget {
  /// Ignores [label] if [labelWidget] is provided.
  const UiTextInput({
    super.key,
    this.label,
    this.labelWidget,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.hasError = false,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
  }) : variant = TextInputVariant.standard;

  const UiTextInput.obscure({
    super.key,
    this.label,
    this.labelWidget,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.hasError = false,
    this.obscureText = true,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
  }) : variant = TextInputVariant.obscure;

  final String? label;

  final Widget? labelWidget;

  final String? initialValue;

  final ValueChanged<String>? onChanged;

  final String? errorText;

  final bool hasError;

  final bool obscureText;

  final TextInputVariant variant;

  final Widget? prefixIcon;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final bool enabled;

  @override
  State<UiTextInput> createState() => _UiTextInputState();
}

class _UiTextInputState extends State<UiTextInput> {
  late Color _borderColor;

  late ColorPalette _palette;

  static late Color _scaffoldBg;

  late final FocusNode _focusNode;

  late final TextEditingController _controller;

  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(handleFocusChange);
    _controller = TextEditingController(text: widget.initialValue);
    _isObscured = widget.obscureText;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
    _palette = Theme.of(context).colorPalette;
    _borderColor = _buildBorderColorBasedOnValue();
  }

  @override
  void didUpdateWidget(UiTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.hasError != widget.hasError ||
        oldWidget.errorText != widget.errorText) {
      setState(() {
        _borderColor = _buildBorderColorBasedOnValue();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(handleFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void handleFocusChange() {
    setState(() {
      if (_focusNode.hasFocus) {
        _borderColor = widget.hasError
            ? _palette.destructive
            : _palette.primary;
      } else {
        _borderColor = _buildBorderColorBasedOnValue();
      }
    });
  }

  Color _buildBorderColorBasedOnValue() {
    if (widget.hasError) {
      return _palette.destructive;
    }

    if (_controller.text.isNotEmpty) {
      return _palette.primary;
    }

    return _palette.dark03;
  }

  void _changeVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            alignment: Alignment.center,
            padding: const EdgeInsetsDirectional.only(
              start: 14,
              top: 8,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: _palette.white,
              border: Border.all(color: _borderColor, width: 1.0),
            ),
            child: TextField(
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              controller: _controller,
              obscureText: _isObscured,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              enabled: widget.enabled,
              decoration: InputDecoration(
                label:
                    widget.labelWidget ??
                    UiText.baseRegular(widget.label, color: _palette.dark05),
                hoverColor: _scaffoldBg,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: _palette.white,
                suffixIcon: widget.variant == TextInputVariant.obscure
                    ? _VisibilityToggle(
                        isObscured: _isObscured,
                        onChange: _changeVisibility,
                      )
                    : null,
                suffix: doesAllowSuffix ? _ErrorSuffixIcon() : null,
                isDense: true,
                prefixIcon: widget.prefixIcon,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          if (widget.hasError && widget.errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 4),
              child: UiText.captionRegular(
                widget.errorText,
                color: _palette.destructive,
              ).fadeInList(0, true, true),
            ),
        ],
      ),
    );
  }

  bool get doesAllowSuffix {
    return widget.hasError && widget.variant == TextInputVariant.standard;
  }
}

class _ErrorSuffixIcon extends StatelessWidget {
  const _ErrorSuffixIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8.0),
      child: Icon(
        Icons.error_outline,
        color: Theme.of(context).colorPalette.destructive,
        size: 18,
      ).fadeInList(0, true, true),
    );
  }
}

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({this.isObscured, this.onChange});

  final bool? isObscured;
  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: RepaintBoundary(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: isObscured == true
              ? const _VisibilityOffIcon()
              : const _VisibilityOnIcon(),
        ),
      ),
    );
  }
}

class _VisibilityOffIcon extends StatelessWidget {
  const _VisibilityOffIcon();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorPalette.dark05;
    return UiSvg(SvgAssets.eye, color: color);
  }
}

class _VisibilityOnIcon extends StatelessWidget {
  const _VisibilityOnIcon();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorPalette.dark05;
    return UiSvg(SvgAssets.eyeSlash, color: color);
  }
}
