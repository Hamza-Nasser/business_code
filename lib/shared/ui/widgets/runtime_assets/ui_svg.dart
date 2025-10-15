import 'package:business_code/core/string_manipulators/string_validation.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class UiSvg extends StatelessWidget {
  const UiSvg(this.assetPath, {super.key, this.color, this.width, this.height});

  final String assetPath;

  final Color? color;

  final double? width;

  final double? height;

  @override
  Widget build(BuildContext context) {
    if (!assetPath.hasActualValue) {
      return const SizedBox.shrink();
    }
    return VectorGraphic(
      loader: AssetBytesLoader(assetPath),
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      width: width,
      height: height,
    );
  }
}
