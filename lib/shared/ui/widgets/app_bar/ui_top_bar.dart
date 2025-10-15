import 'package:flutter/material.dart';

class UiTopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? endWidget;
  final double elevation;
  final bool automaticallyImplyLeading;
  final Widget? leading;

  const UiTopBar({
    super.key,
    this.title,
    this.leading,
    this.endWidget,
    this.elevation = 0.0,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    return AppBar(
      title: title,
      centerTitle: false,
      backgroundColor: color,
      surfaceTintColor: color,
      elevation: elevation,
      shadowColor: Colors.black,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: 16,
      actionsPadding: EdgeInsetsDirectional.only(end: 16.0),
      actions: [?endWidget],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
