import 'package:business_code/configurations/navigation/app_navigator.dart';
import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultNavigator implements AppNavigator {
  final bool debugLogDiagnostics;

  const DefaultNavigator({this.debugLogDiagnostics = false});

  @override
  bool isCurrentScreen(BuildContext context, Screen route) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return currentRoute == route.screenRoute.name;
  }

  @override
  Future<T?> push<T>(BuildContext context, Screen screen) {
    return Navigator.of(context).push<T>(_getPageRoute(screen: screen));
  }

  @override
  Future<T?> pushAndRemoveAll<T, TO>(BuildContext context, Screen screen) {
    return Navigator.of(context).pushAndRemoveUntil<T>(
      _getPageRoute(screen: screen),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  @override
  void popUntil(BuildContext context, ScreenRoute route) {
    Navigator.of(context).popUntil((r) => r.settings.name == route.name);
  }

  @override
  Future<T?> pushAndRemoveUntil<T, TO>(
    BuildContext context,
    Screen screen,
    Screen removeUntilRoute,
  ) {
    return Navigator.of(context).pushAndRemoveUntil<T>(
      _getPageRoute(screen: screen),
      ModalRoute.withName(removeUntilRoute.screenRoute.name),
    );
  }

  @override
  Future<T?> pushModal<T>(
    BuildContext context,
    Screen screen, {
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => screen.widget,
    );
  }

  @override
  Future<T?> pushReplacement<T, TO>(BuildContext context, Screen screen) {
    return Navigator.of(
      context,
    ).pushReplacement<T, TO>(_getPageRoute(screen: screen));
  }

  static PageRoute<T> _getPageRoute<T>({required Screen screen}) {
    final settings = RouteSettings(name: screen.screenRoute.name);
    return switch (screen.transition) {
      ScreenTransition.cupertino => CupertinoPageRoute<T>(
        builder: (_) => screen.widget,
        settings: settings,
      ),
      ScreenTransition.fadeIn => PageRouteBuilder<T>(
        pageBuilder: (_, __, ___) => screen.widget,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        settings: settings,
      ),
      ScreenTransition.slideIn => PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => screen.widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: settings,
      ),
      ScreenTransition.material => MaterialPageRoute<T>(
        builder: (_) => screen.widget,
        settings: settings,
      ),
    };
  }

  @override
  bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}
