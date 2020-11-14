import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

/// Providers are declared globally and specifies how to create a state
final counterProvider = StateProvider((ref) => 0);

// A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
// For example, this will indent the child by enough to avoid the status bar at the top of the screen.
// It will also indent the child by the amount necessary to avoid The Notch on the iPhone X,
// or other similar creative physical features of the display.
// When a minimum padding is specified, the greater of the minimum padding or the safe area padding will be applied.
class NotificationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification example')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        // You could also use the hook "useProvider" if you uses flutter_hooks
        child: Consumer(builder: (context, watch, _) {
          final count = watch(counterProvider).state;
          return Text('$count', style: TextStyle(fontSize: 24));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => showSimpleNotification(
          Text("Subscribe to FilledStacks"),
          background: Colors.purple,
          autoDismiss: false,
          trailing: Builder(builder: (context) {
            return FlatButton(
                textColor: Colors.yellow,
                onPressed: () {
                  OverlaySupportEntry.of(context).dismiss();
                },
                child: Text('Dismiss'));
          }),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
