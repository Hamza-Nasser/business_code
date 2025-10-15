import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).colorPalette.dark02;
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 36),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: borderColor, width: 1)),
      ),
      child: child,
    );
  }
}
