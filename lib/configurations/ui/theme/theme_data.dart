import 'package:business_code/configurations/ui/theme/theme_helpers.dart';
import 'package:flutter/material.dart';

/// An extension for theme to provide a color palette in context.
class ColorPalette extends ThemeExtension<ColorPalette> {
  const ColorPalette({
    required this.bg,
    required this.white,
    required this.active,
    required this.card,
    required this.dark,
    required this.primary,
    required this.secondary,
    required this.blue,
    required this.surfaceBg,
    required this.dark07,
    required this.dark06,
    required this.dark05,
    required this.dark04,
    required this.dark03,
    required this.dark02,
    required this.dark01,
    required this.destructive,
    required this.ring,
  });

  final Color bg;
  final Color white;
  final Color active;
  final Color card;
  final Color dark;
  final Color primary;
  final Color secondary;
  final Color blue;
  final Color surfaceBg;
  final Color dark07;
  final Color dark06;
  final Color dark05;
  final Color dark04;
  final Color dark03;
  final Color dark02;
  final Color dark01;
  final Color destructive;
  final Color ring;

  @override
  ThemeExtension<ColorPalette> copyWith({
    Color? bg,
    Color? white,
    Color? active,
    Color? card,
    Color? dark,
    Color? primary,
    Color? secondary,
    Color? blue,
    Color? surfaceBg,
    Color? dark07,
    Color? dark06,
    Color? dark05,
    Color? dark04,
    Color? dark03,
    Color? dark02,
    Color? dark01,
    Color? destructive,
    Color? ring,
  }) => ColorPalette(
    bg: bg ?? this.bg,
    white: white ?? this.white,
    active: active ?? this.active,
    card: card ?? this.card,
    dark: dark ?? this.dark,
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    blue: blue ?? this.blue,
    surfaceBg: surfaceBg ?? this.surfaceBg,
    dark07: dark07 ?? this.dark07,
    dark06: dark06 ?? this.dark06,
    dark05: dark05 ?? this.dark05,
    dark04: dark04 ?? this.dark04,
    dark03: dark03 ?? this.dark03,
    dark02: dark02 ?? this.dark02,
    dark01: dark01 ?? this.dark01,
    destructive: destructive ?? this.destructive,
    ring: ring ?? this.ring,
  );

  @override
  ThemeExtension<ColorPalette> lerp(
    covariant ThemeExtension<ColorPalette>? other,
    double t,
  ) {
    if (other == null || other is! ColorPalette) {
      return this;
    }

    return ColorPalette(
      bg: Color.lerp(bg, other.bg, t)!,
      white: Color.lerp(white, other.white, t)!,
      active: Color.lerp(active, other.active, t)!,
      card: Color.lerp(card, other.card, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      surfaceBg: Color.lerp(surfaceBg, other.surfaceBg, t)!,
      dark07: Color.lerp(dark07, other.dark07, t)!,
      dark06: Color.lerp(dark06, other.dark06, t)!,
      dark05: Color.lerp(dark05, other.dark05, t)!,
      dark04: Color.lerp(dark04, other.dark04, t)!,
      dark03: Color.lerp(dark03, other.dark03, t)!,
      dark02: Color.lerp(dark02, other.dark02, t)!,
      dark01: Color.lerp(dark01, other.dark01, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      ring: Color.lerp(ring, other.ring, t)!,
    );
  }

  Map<String, Color> toMap() => {
    'Background': bg,
    'Foreground': white,
    'Muted': active,
    'Muted Foreground': card,
    'Border': dark,
    'Primary': primary,
    'Secondary': secondary,
    'Blue': blue,
    'Surface': surfaceBg,
    'Primary Foreground': dark07,
    'Secondary Foreground': dark05,
    'Accent': dark04,
    'Accent Foreground': dark03,
    'Destructive': dark02,
    'Destructive Foreground': dark01,
    'Destructive Background': destructive,
    'Ring': ring,
  };
}

/// An extension for theme to provide typography in context.
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.headlineBold,
    required this.headlineSemibold,
    required this.headlineMedium,
    required this.headlineRegular,
    required this.largeBold,
    required this.largeSemibold,
    required this.largeMedium,
    required this.largeRegular,
    required this.titleBold,
    required this.titleSemibold,
    required this.titleMedium,
    required this.titleRegular,
    required this.baseBold,
    required this.baseSemibold,
    required this.baseMedium,
    required this.baseRegular,
    required this.smallBold,
    required this.smallSemibold,
    required this.smallMedium,
    required this.smallRegular,
    required this.captionBold,
    required this.captionSemibold,
    required this.captionMedium,
    required this.captionRegular,
  });

  final TextStyle headlineBold;
  final TextStyle headlineSemibold;
  final TextStyle headlineMedium;
  final TextStyle headlineRegular;

  final TextStyle largeBold;
  final TextStyle largeSemibold;
  final TextStyle largeMedium;
  final TextStyle largeRegular;

  final TextStyle titleBold;
  final TextStyle titleSemibold;
  final TextStyle titleMedium;
  final TextStyle titleRegular;

  final TextStyle baseBold;
  final TextStyle baseSemibold;
  final TextStyle baseMedium;
  final TextStyle baseRegular;

  final TextStyle smallBold;
  final TextStyle smallSemibold;
  final TextStyle smallMedium;
  final TextStyle smallRegular;

  final TextStyle captionBold;
  final TextStyle captionSemibold;
  final TextStyle captionMedium;
  final TextStyle captionRegular;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? headlineBold,
    TextStyle? headlineSemibold,
    TextStyle? headlineMedium,
    TextStyle? headlineRegular,
    TextStyle? largeBold,
    TextStyle? largeSemibold,
    TextStyle? largeMedium,
    TextStyle? largeRegular,
    TextStyle? titleBold,
    TextStyle? titleSemibold,
    TextStyle? titleMedium,
    TextStyle? titleRegular,
    TextStyle? baseBold,
    TextStyle? baseSemibold,
    TextStyle? baseMedium,
    TextStyle? baseRegular,
    TextStyle? smallBold,
    TextStyle? smallSemibold,
    TextStyle? smallMedium,
    TextStyle? smallRegular,
    TextStyle? captionBold,
    TextStyle? captionSemibold,
    TextStyle? captionMedium,
    TextStyle? captionRegular,
  }) => AppTypography(
    headlineBold: headlineBold ?? this.headlineBold,
    headlineSemibold: headlineSemibold ?? this.headlineSemibold,
    headlineMedium: headlineMedium ?? this.headlineMedium,
    headlineRegular: headlineRegular ?? this.headlineRegular,
    largeBold: largeBold ?? this.largeBold,
    largeSemibold: largeSemibold ?? this.largeSemibold,
    largeMedium: largeMedium ?? this.largeMedium,
    largeRegular: largeRegular ?? this.largeRegular,
    titleBold: titleBold ?? this.titleBold,
    titleSemibold: titleSemibold ?? this.titleSemibold,
    titleMedium: titleMedium ?? this.titleMedium,
    titleRegular: titleRegular ?? this.titleRegular,
    baseBold: baseBold ?? this.baseBold,
    baseSemibold: baseSemibold ?? this.baseSemibold,
    baseMedium: baseMedium ?? this.baseMedium,
    baseRegular: baseRegular ?? this.baseRegular,
    smallBold: smallBold ?? this.smallBold,
    smallSemibold: smallSemibold ?? this.smallSemibold,
    smallMedium: smallMedium ?? this.smallMedium,
    smallRegular: smallRegular ?? this.smallRegular,
    captionBold: captionBold ?? this.captionBold,
    captionSemibold: captionSemibold ?? this.captionSemibold,
    captionMedium: captionMedium ?? this.captionMedium,
    captionRegular: captionRegular ?? this.captionRegular,
  );

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other == null || other is! AppTypography) {
      return this;
    }

    return AppTypography(
      headlineBold: TextStyle.lerp(headlineBold, other.headlineBold, t)!,
      headlineSemibold: TextStyle.lerp(
        headlineSemibold,
        other.headlineSemibold,
        t,
      )!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineRegular: TextStyle.lerp(
        headlineRegular,
        other.headlineRegular,
        t,
      )!,
      largeBold: TextStyle.lerp(largeBold, other.largeBold, t)!,
      largeSemibold: TextStyle.lerp(largeSemibold, other.largeSemibold, t)!,
      largeMedium: TextStyle.lerp(largeMedium, other.largeMedium, t)!,
      largeRegular: TextStyle.lerp(largeRegular, other.largeRegular, t)!,
      titleBold: TextStyle.lerp(titleBold, other.titleBold, t)!,
      titleSemibold: TextStyle.lerp(titleSemibold, other.titleSemibold, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleRegular: TextStyle.lerp(titleRegular, other.titleRegular, t)!,
      baseBold: TextStyle.lerp(baseBold, other.baseBold, t)!,
      baseSemibold: TextStyle.lerp(baseSemibold, other.baseSemibold, t)!,
      baseMedium: TextStyle.lerp(baseMedium, other.baseMedium, t)!,
      baseRegular: TextStyle.lerp(baseRegular, other.baseRegular, t)!,
      smallBold: TextStyle.lerp(smallBold, other.smallBold, t)!,
      smallSemibold: TextStyle.lerp(smallSemibold, other.smallSemibold, t)!,
      smallMedium: TextStyle.lerp(smallMedium, other.smallMedium, t)!,
      smallRegular: TextStyle.lerp(smallRegular, other.smallRegular, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      captionSemibold: TextStyle.lerp(
        captionSemibold,
        other.captionSemibold,
        t,
      )!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      captionRegular: TextStyle.lerp(captionRegular, other.captionRegular, t)!,
    );
  }
}

/// An extension for theme to get color palette and typography from [BuildContext].
extension ThemeDataExtensions on ThemeData {
  /// The color palette set for the app.
  ColorPalette get colorPalette =>
      extension<ColorPalette>() ?? lightColorPalette;

  /// The typography set for the app.
  AppTypography get appTypography =>
      extension<AppTypography>() ?? defaultTypography;
}
