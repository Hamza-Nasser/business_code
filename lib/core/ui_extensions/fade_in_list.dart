import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

extension AnimatedWidgetExtension on Widget {
  fadeInList(int index, bool isVertical, bool? animate) {
    double offset = 25.0;
    if (animate ?? true) {
      return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          horizontalOffset: isVertical ? 0.0 : offset,
          verticalOffset: !isVertical ? 0.0 : offset,
          child: FadeInAnimation(child: this),
        ),
      );
    }
    return this;
  }
}
