import 'package:business_code/configurations/navigation/app_navigator.dart';
import 'package:business_code/configurations/navigation/navigator_provider/navigator_provider.dart';
import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:flutter/widgets.dart';

extension NavigatorExtensions on BuildContext {
  AppNavigator get _navigator => NavigatorProvider.of(this);

  Future<T?> push<T>(Screen screen) => _navigator.push<T>(this, screen);

  Future<T?> pushReplacement<T, TO>(Screen screen) =>
      _navigator.pushReplacement<T, TO>(this, screen);

  Future<T?> pushAndRemoveUntil<T, TO>(
    Screen screen,
    Screen removeUntilRoute,
  ) => _navigator.pushAndRemoveUntil<T, TO>(this, screen, removeUntilRoute);

  Future<T?> pushAndRemoveAll<T, TO>(Screen screen) =>
      _navigator.pushAndRemoveAll<T, TO>(this, screen);

  void pop<T extends Object?>([T? result]) => _navigator.pop<T>(this, result);

  void popUntil(ScreenRoute route) => _navigator.popUntil(this, route);

  bool isCurrentScreen(Screen route) => _navigator.isCurrentScreen(this, route);

  Future<T?> pushModal<T>(Screen screen, {bool isScrollControlled = true}) =>
      _navigator.pushModal<T>(
        this,
        screen,
        isScrollControlled: isScrollControlled,
      );

  bool canPop() => _navigator.canPop(this);
}
