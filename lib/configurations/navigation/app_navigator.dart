import 'package:flutter/material.dart';

import 'screen.dart';
import 'screen_route_enum.dart';

abstract class AppNavigator {
  Future<T?> push<T>(
    BuildContext context,
    Screen screen,
  );

  Future<T?> pushReplacement<T, TO>(
    BuildContext context,
    Screen screen,
  );

  /// Pushes a new screen and removes screens until a specified [removeUntilRoute] is reached.
  Future<T?> pushAndRemoveUntil<T, TO>(
    BuildContext context,
    Screen screen,
    Screen removeUntilRoute,
  );

  Future<T?> pushAndRemoveAll<T, TO>(
    BuildContext context,
    Screen screen,
  );

  void pop<T extends Object?>(BuildContext context, [T? result]);

  void popUntil(BuildContext context, ScreenRoute route);

  /// Checks if the current screen matches a specified [route].
  bool isCurrentScreen(BuildContext context, Screen route);

  /// Optional: Shows a modal or bottom sheet.
  Future<T?> pushModal<T>(
    BuildContext context,
    Screen screen, {
    bool isScrollControlled = true,
  });

  bool canPop(BuildContext context);
}
