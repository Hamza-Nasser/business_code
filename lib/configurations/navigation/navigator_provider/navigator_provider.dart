import 'package:flutter/widgets.dart';

import '../app_navigator.dart';

class NavigatorProvider extends InheritedWidget {
  final AppNavigator appNavigator;

  const NavigatorProvider({
    super.key,
    required super.child,
    required this.appNavigator,
  });

  static AppNavigator of(BuildContext context) {
    final NavigatorProvider? navigatorProvider = context
        .dependOnInheritedWidgetOfExactType<NavigatorProvider>();
    assert(navigatorProvider != null, 'NavigatorProvider not found in context');
    return navigatorProvider!.appNavigator;
  }

  @override
  bool updateShouldNotify(NavigatorProvider oldWidget) {
    return appNavigator != oldWidget.appNavigator;
  }
}
