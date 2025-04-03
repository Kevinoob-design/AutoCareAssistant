import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

OverlayEntry? _overlayEntry;

void showFloatingBanner(BuildContext context, String message) {
  if (_overlayEntry != null) return; // Prevent multiple banners

  _overlayEntry = OverlayEntry(
    builder: (context) {
      return _FloatingBanner(onDismiss: _removeBanner, message: message);
    },
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void _removeBanner() {
  _overlayEntry?.remove();
  _overlayEntry = null;
}

class _FloatingBanner extends StatefulWidget {
  final VoidCallback onDismiss;
  final String message;

  const _FloatingBanner({required this.onDismiss, required this.message});

  @override
  State<_FloatingBanner> createState() => _FloatingBannerState();
}

class _FloatingBannerState extends State<_FloatingBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation = Tween<Offset>(
      begin: Offset(0, -5), // Start off-screen
      end: Offset(0, 0), // Slide into position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.forward();

    // Auto-hide after 3 seconds
    Future.delayed(Duration(seconds: 3), _dismissBanner);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismissBanner() {
    if (!mounted) return;

    _controller.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: SlideTransition(
        position: _animation,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text(widget.message)),
                TextButton(
                  onPressed: _dismissBanner,
                  child: Text(AppLocalizations.of(context)!.notificationBannerActionLabel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
