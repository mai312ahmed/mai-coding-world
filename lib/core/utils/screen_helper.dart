import 'package:flutter/material.dart';

class ScreenHelper {
  static const double mobile = 550;
  static const double tablet = 600;
  static const double desktop = 900;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < tablet;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tablet && width < desktop;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktop;
}
