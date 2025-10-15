import 'package:business_code/app.dart';
import 'package:business_code/configurations/di/injector.dart';
import 'package:business_code/core/services/prefs/prefs.dart';
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Future.wait([
    PreferenceUtils.init(),
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);
  runApp(const MainApp());
}
