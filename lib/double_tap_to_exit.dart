library double_tap_to_exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoubleTapToExit extends StatefulWidget {
  const DoubleTapToExit({
    super.key,
    required this.child,
    this.snackBar,
  });

  final Widget child;
  final SnackBar? snackBar;

  @override
  State<DoubleTapToExit> createState() => _DoubleTapToExitState();
}

class _DoubleTapToExitState extends State<DoubleTapToExit> {
  DateTime? _lastBackPressTime;

  Future<bool> _shouldExit() async {
    final now = DateTime.now();
    if (_lastBackPressTime == null || now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        widget.snackBar ?? const SnackBar(content: Text('Tap again to exit!')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          final shouldExit = await _shouldExit();
          if (shouldExit) {
            SystemNavigator.pop();
          }
        }
      },
      child: widget.child,
    );
  }
}
