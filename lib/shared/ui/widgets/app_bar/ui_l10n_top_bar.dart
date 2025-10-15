import 'package:business_code/configurations/navigation/navigator_extensions.dart';
import 'package:business_code/shared/ui/widgets/app_bar/ui_top_bar.dart';
import 'package:business_code/shared/ui/widgets/buttons/change_language_button.dart';
import 'package:flutter/material.dart';

class UiL10nTopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? endWidget;

  const UiL10nTopBar({super.key, this.endWidget});
  const UiL10nTopBar.withCloseButton({super.key})
    : endWidget = const CloseButton();

  @override
  Widget build(BuildContext context) {
    return UiTopBar(title: ChangeLanguageButton(), endWidget: endWidget);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  void _navigateBackIfPossible(BuildContext context) {
    if (context.canPop()) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () => _navigateBackIfPossible(context),
        child: Icon(Icons.close),
      ),
    );
  }
}
