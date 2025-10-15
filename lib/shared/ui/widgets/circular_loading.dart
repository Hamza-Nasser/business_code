import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

enum LoadingVariant { labeled, unlabeled }

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    super.key,
    this.title,
    this.size = 14,
    this.color,
    this.variant = LoadingVariant.unlabeled,
  });

  const CircularLoading.unlabeled({super.key, this.size = 14, this.color})
    : title = null,
      variant = LoadingVariant.unlabeled;

  const CircularLoading.labeled({
    super.key,
    required String this.title,
    this.size = 14,
    this.color,
  }) : variant = LoadingVariant.labeled;

  final String? title;
  final LoadingVariant variant;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final disabledForegroundColor =
        color ?? Theme.of(context).colorPalette.dark01;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: RepaintBoundary(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: disabledForegroundColor,
            ),
          ),
        ),
        if (variant == LoadingVariant.labeled && title != null) ...[
          const SizedBox(width: 6),
          UiText.baseSemibold(title!),
        ],
      ],
    );
  }
}
