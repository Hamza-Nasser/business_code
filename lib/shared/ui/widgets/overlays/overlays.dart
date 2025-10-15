import 'package:business_code/core/resources/svg_assets.dart';
import 'package:business_code/shared/ui/widgets/runtime_assets/ui_svg.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, {String? message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: UiText.smallMedium(
        message ?? "Something went wrong, please try again",
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
    ),
  );
}

void showInfoTopOverlay(
  BuildContext context, {
  String? title,
  String? message,
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _OverlayMode2(
      messages: [message ?? "Something went wrong, please try again"],
      backgroundColor: Colors.white,
      title: title ?? "Info",
      primaryColor: Color.fromRGBO(107, 114, 128, 1),
      leadingIcon: Icon(
        Icons.info_outline,
        size: 30,
        color: Color.fromRGBO(107, 114, 128, 1),
      ),
      onEnd: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}

void showErrorTopOverlay(BuildContext context, {String? message}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _OverlayMode2(
      messages: [message ?? "Something went wrong, please try again"],
      backgroundColor: Colors.white,
      title: "Something went wrong",
      primaryColor: Colors.red,
      leadingIcon: UiSvg(
        SvgAssets.circleX,
        width: 24,
        height: 24,
        color: Colors.red,
      ),
      onEnd: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}

void showErrorListTopOverlayMode2(
  BuildContext context,
  List<String> messages, {
  String? title,
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _OverlayMode2(
      title: title ?? "Something went wrong, please try again",
      messages: messages,
      backgroundColor: Colors.white,
      primaryColor: Colors.red,
      leadingIcon: UiSvg(
        SvgAssets.circleX,
        width: 30,
        height: 30,
        color: Colors.red,
      ),
      onEnd: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}

void showSuccessTopOverlay(BuildContext context, {String? message}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => _OverlayMode2(
      title: "Success",
      messages: [message ?? "Completed successfully"],
      backgroundColor: Colors.white,
      primaryColor: Colors.green,
      leadingIcon: Icon(
        Icons.check_circle_outline,
        size: 30,
        color: Colors.green,
      ),
      onEnd: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}

class _Overlay extends StatefulWidget {
  final String message;
  final VoidCallback onEnd;

  const _Overlay({required this.message, required this.onEnd});

  @override
  _OverlayState createState() => _OverlayState();
}

class _OverlayState extends State<_Overlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 5), () {
      _controller.reverse().then((_) => widget.onEnd());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewInsets.top + 60,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: _controller,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 31, 31, 31),
              borderRadius: BorderRadius.circular(8),
            ),
            child: UiText.smallRegular(widget.message, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _OverlayMode2 extends StatefulWidget {
  final String title;
  final List<String> messages;
  final VoidCallback onEnd;
  final Widget? leadingIcon;
  final Color backgroundColor;
  final Color primaryColor;

  const _OverlayMode2({
    required this.title,
    required this.messages,
    required this.onEnd,
    this.leadingIcon,
    this.backgroundColor = const Color.fromARGB(255, 31, 31, 31),
    this.primaryColor = Colors.black,
  });

  @override
  _OverlayMode2State createState() => _OverlayMode2State();
}

class _OverlayMode2State extends State<_OverlayMode2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) widget.onEnd();
        });
      }
    });
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

  void _closeOverlay() {
    if (mounted) {
      _controller.reverse().then((_) {
        if (mounted) {
          widget.onEnd();
        }
      });
    }
  }

  double get overlayHeight => widget.messages.length * 30.0 + 50;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewInsets.top + 60,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: _controller,
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: 8,
                  height: overlayHeight,
                  decoration: BoxDecoration(
                    color: widget.primaryColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(6),
                      bottomStart: Radius.circular(6),
                    ),
                  ),
                ),
                if (widget.leadingIcon != null) ...{
                  widget.leadingIcon!,
                  const SizedBox(width: 8),
                },
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText.smallMedium(
                        widget.title,
                        maxLines: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 2),
                      for (var message in widget.messages) ...{
                        UiText.captionRegular(
                          message,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black38,
                        ),
                        const SizedBox(height: 2),
                      },
                    ],
                  ),
                ),
                Container(
                  height: overlayHeight,
                  width: 0.5,
                  color: Colors.black12,
                ),
                const SizedBox(width: 2),
                InkWell(
                  onTap: _closeOverlay,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: overlayHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: UiText.captionRegular(
                        "Close",
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
