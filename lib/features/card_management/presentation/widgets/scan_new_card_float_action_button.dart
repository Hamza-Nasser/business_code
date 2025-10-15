import 'package:business_code/configurations/navigation/navigator_extensions.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/features/card_management/presentation/screens/scan_new_card/scan_new_card_screen.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:flutter/material.dart';

class ScanNewCardFloatActionButton extends StatelessWidget {
  const ScanNewCardFloatActionButton({super.key});

  void _navigateToScanNewCardScreen(BuildContext context) async {
    const screen = ScanNewCardScreen();
    final needsRefresh = await context.push(screen) as bool?;
    if (needsRefresh == true) {
      // context.read().fetchCards();
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    final colors = [palette.primary, palette.blue];
    return InkWell(
      onTap: () => _navigateToScanNewCardScreen(context),
      child: Container(
        height: 56,
        width: 56,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsetsDirectional.only(bottom: 8, start: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const UiSvg(SvgAssets.qr, color: Colors.white, height: 24),
      ),
    );
  }
}
