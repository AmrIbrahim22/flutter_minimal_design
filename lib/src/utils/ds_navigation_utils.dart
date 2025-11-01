import 'package:flutter/material.dart';

class NavigationUtils {
  NavigationUtils._();

  /// Smart back navigation that works with any navigation package
  static void defaultBackAction(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}