import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1200) {
      return desktop ??
          tablet ??
          mobile ??
          const Material(
            child: Text('No Desktop or Tablet or Mobile Widget'),
          );
    } else if (size.width >= 800) {
      return tablet ??
          mobile ??
          const Material(
            child: Text('No Tablet or Mobile Widget'),
          );
    } else {
      return mobile ??
          const Material(
            child: Text('No Mobile Widget'),
          );
    }
  }
}
