import 'package:business_code/configurations/navigation/screen.dart';
import 'package:business_code/configurations/navigation/screen_route_enum.dart';
import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/features/card_management/presentation/screens/list_cards/list_cards_screen.dart';
import 'package:business_code/features/card_management/presentation/widgets/cards_list_empty_view.dart';
import 'package:business_code/shared/ui/widgets/app_bar/ui_top_bar.dart';
import 'package:business_code/shared/ui/widgets/buttons/button.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:business_code/shell/bloc/shell_bloc.dart';
import 'package:business_code/shell/widgets/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppShell extends StatelessScreen {
  const AppShell({super.key});

  @override
  ScreenRoute get screenRoute => ScreenRoute.appShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShellBloc(),
      child: Scaffold(
        appBar: UiTopBar(
          title: UiSvg(SvgAssets.logoColorful, height: 30),
          endWidget: SearchButton(),
          automaticallyImplyLeading: true,
          elevation: 1,
        ),
        drawer: const Drawer(),
        body: const _Navigator(),
        bottomNavigationBar: const _BottomBar(),
      ),
    );
  }
}

class _Navigator extends StatelessWidget {
  const _Navigator();

  @override
  Widget build(BuildContext context) {
    final currentTab = context.select((ShellBloc b) => b.state.currentTab);
    return IndexedStack(
      index: ShellTab.values.indexOf(currentTab),
      children: const [ListCardsScreen(), CardsListEmptyView()],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  Radius get _radius => Radius.circular(8);

  @override
  Widget build(BuildContext context) {
    final currentTab = context.select(
      (ShellBloc bloc) => bloc.state.currentTab,
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: _radius, topRight: _radius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _BottomBarItem(
                icon: SvgAssets.home,
                tab: ShellTab.listCards,
                isSelected: currentTab == ShellTab.listCards,
              ),
            ),
            Expanded(
              child: _BottomBarItem(
                icon: SvgAssets.analytics,
                tab: ShellTab.analytics,
                isSelected: currentTab == ShellTab.analytics,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem({
    required this.icon,
    required this.tab,
    this.isSelected = false,
  });

  final String icon;
  final ShellTab tab;
  final bool isSelected;

  void _changeCurrentTab(BuildContext context, ShellTab tab) {
    context.read<ShellBloc>().add(ShellTabChanged(tab));
  }

  String get _tabName => tab.toString();

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    final color = isSelected ? palette.primary : palette.dark04;
    return UiButton.text(
      onPressed: () => _changeCurrentTab(context, tab),
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          UiSvg(icon, height: 24, color: color),
          if (isSelected)
            UiText.captionSemibold(_tabName, color: color)
          else
            UiText.captionRegular(_tabName, color: color),
        ],
      ),
    );
  }
}
