import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Providers are declared globally and specifies how to create a state
var counterProvider = StateProvider((ref) => 0);

// A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
// For example, this will indent the child by enough to avoid the status bar at the top of the screen.
// It will also indent the child by the amount necessary to avoid The Notch on the iPhone X,
// or other similar creative physical features of the display.
// When a minimum padding is specified, the greater of the minimum padding or the safe area padding will be applied.
class SafeAreaExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Text(
            "A widget that insets its child by sufficient padding to avoid intrusions by the operating system."),
      ),
    );
  }
}
