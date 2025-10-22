import 'package:flutter/material.dart';
import 'package:app_state_provider/models/user.dart';

class UserNotifier extends InheritedNotifier<User> {
  const UserNotifier({super.key, required User user, required Widget child})
    : super(notifier: user, child: child);

  static UserNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserNotifier>();
  }

  static User of(BuildContext context) {
    // Check if the user notifier exists in the widget tree
    final UserNotifier? result = maybeOf(context);

    if (result == null || result.notifier == null) {
      throw StateError('No UserInheritedNotifier found in context');
    }

    return result.notifier!;
  }
}
