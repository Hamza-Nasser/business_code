import 'package:business_code/configurations/ui/palette/dark_color_palette.dart';
import 'package:business_code/configurations/ui/palette/light_color_palette.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/configurations/ui/typography/typography_styles.dart';
import 'package:flutter/material.dart';

final lightColorPalette = generatePaletteForBrightness(Brightness.light);
final darkColorPalette = generatePaletteForBrightness(Brightness.dark);

final AppTypography defaultTypography = AppTypography(
  headlineBold: TypographyStyles.headlineBold,
  headlineSemibold: TypographyStyles.headlineSemibold,
  headlineMedium: TypographyStyles.headlineMedium,
  headlineRegular: TypographyStyles.headlineRegular,
  largeBold: TypographyStyles.largeBold,
  largeSemibold: TypographyStyles.largeSemibold,
  largeMedium: TypographyStyles.largeMedium,
  largeRegular: TypographyStyles.largeRegular,
  titleBold: TypographyStyles.titleBold,
  titleSemibold: TypographyStyles.titleSemibold,
  titleMedium: TypographyStyles.titleMedium,
  titleRegular: TypographyStyles.titleRegular,
  baseBold: TypographyStyles.baseBold,
  baseSemibold: TypographyStyles.baseSemibold,
  baseMedium: TypographyStyles.baseMedium,
  baseRegular: TypographyStyles.baseRegular,
  smallBold: TypographyStyles.smallBold,
  smallSemibold: TypographyStyles.smallSemibold,
  smallMedium: TypographyStyles.smallMedium,
  smallRegular: TypographyStyles.smallRegular,
  captionBold: TypographyStyles.captionBold,
  captionSemibold: TypographyStyles.captionSemibold,
  captionMedium: TypographyStyles.captionMedium,
  captionRegular: TypographyStyles.captionRegular,
);

/// Creates a [ThemeData] object based on the provided [ColorPalette] and [AppTypography].
///
/// The [brightness] parameter is used to determine the brightness of the theme.
ThemeData createThemeData({
  required ColorPalette palette,
  required AppTypography typography,
  required Brightness brightness,
  required String fontFamily,
}) => ThemeData(
  brightness: brightness,
  fontFamily: fontFamily,
  scaffoldBackgroundColor: palette.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: palette.primary,
    brightness: brightness,
    surface: palette.bg,
    primary: palette.primary,
    onPrimary: palette.white,
    secondary: palette.active,
    onSecondary: palette.white,
    onSurface: palette.dark,
    error: Colors.red.shade700,
    onError: palette.white,
  ),
  extensions: {palette, typography},
);

ColorPalette generatePaletteForBrightness(Brightness brightness) {
  return switch (brightness) {
    Brightness.light => LightColorPalette(),
    Brightness.dark => DarkColorPalette(),
  };
}
