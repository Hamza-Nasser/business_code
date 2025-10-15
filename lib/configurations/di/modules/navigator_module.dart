import 'package:business_code/configurations/navigation/app_navigator.dart';
import 'package:business_code/configurations/navigation/default_navigator/default_navigator.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NavigatorModule {
  @singleton
  AppNavigator get appNavigator => const DefaultNavigator(debugLogDiagnostics: false);
}

