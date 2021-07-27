import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile, tablet, desktop;

  const Responsive(
      {Key? key,
        required this.mobile,
        required this.tablet,
        required this.desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isWideScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 790;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 && !isMobile(context);

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isDesktop(context)) {
        return desktop;
      } else if (isTablet(context)) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}