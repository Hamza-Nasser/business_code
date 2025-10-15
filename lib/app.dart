import 'package:business_code/configurations/di/injector.dart';
import 'package:business_code/configurations/navigation/app_navigator.dart';
import 'package:business_code/configurations/navigation/navigator_provider/navigator_provider.dart';
import 'package:business_code/configurations/navigation/observers/navigator_observer_logger.dart';
import 'package:business_code/configurations/navigation/observers/page_route_tracker_observer.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/configurations/ui/theme/theme_helpers.dart';
import 'package:business_code/core/services/starter/starter_screen.dart';
import 'package:business_code/generated/l10n.dart';
import 'package:business_code/shared/ui/blocs/localization_bloc/localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<NavigatorObserver> navigatorObservers = [
    NavigatorObserverLogger(),
    PageRouteTracker(),
  ];
  ThemeData? theme;

  void _configureStatusBar(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorPalette.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).colorPalette.bg,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _configureStatusBar(context);
  }

  ThemeData createTheme(Locale locale) {
    if (locale.languageCode == 'ar') {
      return createThemeData(
        palette: lightColorPalette,
        typography: defaultTypography,
        brightness: Brightness.light,
        // could be different as your app shows a (quicksand) as a font family for arabic, but I noticed cairo is prettier in arabic
        fontFamily: "cairo",
      );
    }
    return createThemeData(
      palette: lightColorPalette,
      typography: defaultTypography,
      brightness: Brightness.light,
      fontFamily: "cairo",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc()..add(InitLocal()),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return NavigatorProvider(
            appNavigator: sl<AppNavigator>(),
            child: MaterialApp(
              theme: createTheme(state.currentLocale),
              navigatorObservers: navigatorObservers,
              title: "Business Code",
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: state.currentLocale,
              debugShowCheckedModeBanner: false,
              home: const StarterScreen(),
            ),
          );
        },
      ),
    );
  }
}
