import 'dart:io';

import 'package:business_code/configurations/navigation/navigator_extensions.dart';
import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:business_code/features/card_management/presentation/screens/preview_card_details/preview_card_details_screen.dart';
import 'package:business_code/features/card_management/presentation/screens/scan_new_card/components/camera_preview_body.dart';
import 'package:business_code/shared/ui/widgets/app_bar/ui_top_bar.dart';
import 'package:business_code/shared/ui/widgets/buttons/button.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

class ScanNewCardScreen extends StatelessScreen {
  const ScanNewCardScreen({super.key});

  @override
  ScreenRoute get screenRoute => ScreenRoute.scanNewCard;

  void _navigateToPreviewCardDetails(BuildContext context, File image) {
    final screen = PreviewCardDetailsScreen(image: image);
    context.pushReplacement(screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiTopBar(
        automaticallyImplyLeading: false,
        leading: UiButton.icon(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: UiText.baseMedium("Scan Code"),
      ),
      body: CameraPreviewBody(
        onImageCaptured: (image) =>
            _navigateToPreviewCardDetails(context, image),
      ),
    );
  }
}
