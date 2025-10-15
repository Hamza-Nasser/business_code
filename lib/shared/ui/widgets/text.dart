import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:flutter/material.dart';

/// {@template ui_text}
/// A widget that displays a string of text with a specific style.
/// {@endtemplate}
class UiText extends StatelessWidget {
  /// {@macro ui_text}
  const UiText(
    this.data, {
    this.color,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    TextStyle? Function(AppTypography)? styleBuilder,
    super.key,
  }) : _styleBuilder = styleBuilder;

  /// Creates a [UiText] widget with a large display size.
  factory UiText.headlineBold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineBold,
    key: key,
  );

  factory UiText.headlineSemibold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineSemibold,
    key: key,
  );

  factory UiText.headlineMedium(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineMedium,
    key: key,
  );

  factory UiText.headlineRegular(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.headlineRegular,
    key: key,
  );

  factory UiText.largeBold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.largeBold,
    key: key,
  );

  factory UiText.largeSemibold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.largeSemibold,
    key: key,
  );

  factory UiText.largeMedium(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.largeMedium,
    key: key,
  );

  factory UiText.largeRegular(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.largeRegular,
    key: key,
  );

  factory UiText.titleBold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleBold,
    key: key,
  );

  factory UiText.titleSemibold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleSemibold,
    key: key,
  );

  factory UiText.titleMedium(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleMedium,
    key: key,
  );

  factory UiText.titleRegular(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.titleRegular,
    key: key,
  );

  factory UiText.baseBold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.baseBold,
    key: key,
  );

  factory UiText.baseSemibold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.baseSemibold,
    key: key,
  );

  factory UiText.baseMedium(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.baseMedium,
    key: key,
  );

  factory UiText.baseRegular(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.baseRegular,
    key: key,
  );

  factory UiText.smallBold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.smallBold,
    key: key,
  );

  factory UiText.smallSemibold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.smallSemibold,
    key: key,
  );

  factory UiText.smallMedium(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.smallMedium,
    key: key,
  );

  factory UiText.smallRegular(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.smallRegular,
    key: key,
  );

  factory UiText.captionBold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.captionBold,
    key: key,
  );

  factory UiText.captionSemibold(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.captionSemibold,
    key: key,
  );

  factory UiText.captionMedium(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.captionMedium,
    key: key,
  );

  factory UiText.captionRegular(
    String? data, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
  }) => UiText(
    data,
    color: color,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    styleBuilder: (typography) => typography.captionRegular,
    key: key,
  );

  final String? data;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  final Color? color;

  /// A function that builds the text style based on the typography.
  final TextStyle? Function(AppTypography)? _styleBuilder;

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox.shrink();

    final typography = Theme.of(context).appTypography;

    // Get the text style based on the size
    final style = _styleBuilder?.call(typography) ?? typography.baseMedium;

    return Text(
      data!,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style.copyWith(color: color),
    );
  }
}
