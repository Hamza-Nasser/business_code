import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:flutter/material.dart';

enum SurfaceVariant { filled, bordered }

class UiSurface extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double cornerRadius;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final SurfaceVariant variant;

  const UiSurface({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.color,
    this.cornerRadius = 8,
    this.width,
    this.height,
    this.border,
    this.onTap,
  }) : variant = SurfaceVariant.filled;

  const UiSurface.bordered({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.color,
    this.cornerRadius = 8,
    this.width,
    this.height,
    this.border,
    this.onTap,
  }) : variant = SurfaceVariant.bordered;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    final color = this.color ?? palette.surfaceBg;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cornerRadius),
          border: variant == SurfaceVariant.bordered
              ? Border.fromBorderSide(
                  BorderSide(color: palette.primary, width: 1),
                )
              : border,
        ),
        child: child,
      ),
    );
  }
}
