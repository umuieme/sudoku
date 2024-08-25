import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;
}

extension NavigationExtension on BuildContext {
  void pop<T extends Object?>([T? result]) {
    return Navigator.pop(this, result);
  }
}
