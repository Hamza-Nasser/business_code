import 'package:flutter/material.dart';

import 'screen_route_enum.dart';

enum ScreenTransition { material, cupertino, fadeIn, slideIn }

abstract class Screen {
  ScreenRoute get screenRoute;

  Widget get widget;

  ScreenTransition get transition => ScreenTransition.material;
}

abstract class StatelessScreen extends StatelessWidget implements Screen {
  const StatelessScreen({super.key});

  @override
  Widget get widget => this;

  @override
  ScreenTransition get transition => ScreenTransition.material;
}

abstract class StatefulScreen extends StatefulWidget implements Screen {
  const StatefulScreen({super.key});

  @override
  Widget get widget => this;

  @override
  ScreenTransition get transition => ScreenTransition.material;
}
