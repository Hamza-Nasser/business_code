import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:business_code/shared/ui/widgets/surface.dart';
import 'package:flutter/material.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return UiSurface(
      height: 180,
      child: Center(child: UiSvg(SvgAssets.logoColorful, width: 120)),
    );
  }
}
