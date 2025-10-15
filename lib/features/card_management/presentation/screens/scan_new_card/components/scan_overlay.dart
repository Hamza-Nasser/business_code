import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

/// Creates a scanning overlay with a transparent rectangle in the center.
class ScanOverlay extends StatelessWidget {
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  const ScanOverlay({
    super.key,
    this.borderRadius = 12,
    this.borderWidth = 3,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final overlayWidth = constraints.maxWidth * 0.9;
        final overlayHeight = overlayWidth * 0.6;
        final frameCenterY = constraints.maxHeight / 2;

        return Stack(
          children: [
            // Dimmed background with transparent window
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withAlpha(125),
                BlendMode.srcOut,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      backgroundBlendMode: BlendMode.dstOut,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: overlayWidth,
                      height: overlayHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Border around transparent window
            Align(
              alignment: Alignment.center,
              child: Container(
                width: overlayWidth,
                height: overlayHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: borderColor, width: borderWidth),
                ),
              ),
            ),

            // Text precisely below the rectangle
            Positioned(
              top: frameCenterY + (overlayHeight / 2) + 20,
              left: 0,
              right: 0,
              child: UiText.baseMedium(
                "Align the card within the frame",
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
