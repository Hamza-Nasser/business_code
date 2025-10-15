import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: palette.dark04),
        ),
        child: const UiSvg(SvgAssets.search),
      ),
    );
  }
}
