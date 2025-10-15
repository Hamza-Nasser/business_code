import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:flutter/material.dart';

class UnifyLogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UnifyLogoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorPalette.dark;
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 56),
      decoration: BoxDecoration(color: color),
      child: Center(child: UiSvg(SvgAssets.logoWhite, height: 40)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
