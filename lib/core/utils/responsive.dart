import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 &&
      MediaQuery.sizeOf(context).width < 1024;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;
}
