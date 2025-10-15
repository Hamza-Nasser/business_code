import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/features/card_management/domain/entities/card_details.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:business_code/shared/ui/widgets/surface.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class UiCardDetails extends StatelessWidget {
  const UiCardDetails({super.key, required this.card});
  final CardDetails card;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return UiSurface.bordered(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiText.titleMedium(card.title),
                  UiText.smallRegular(card.subtitle, color: palette.dark05),
                ],
              ),

              UiSvg(SvgAssets.logoColorful, height: 30),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.location_city_rounded,
                color: palette.dark05,
                size: 20,
              ),
              const SizedBox(width: 8),
              UiText.smallRegular(card.location),
            ],
          ),
          const SizedBox(height: 4),

          Row(
            children: [
              UiSvg(SvgAssets.sms, color: palette.dark05, height: 20),
              const SizedBox(width: 8),
              UiText.smallRegular(card.email),
            ],
          ),
          const SizedBox(height: 4),
          for (var extra in card.extras)
            Row(
              children: [
                UiSvg(SvgAssets.link, height: 20, color: palette.dark05),
                const SizedBox(width: 8),
                UiText.smallRegular(extra),
              ],
            ),
        ],
      ),
    );
  }
}
