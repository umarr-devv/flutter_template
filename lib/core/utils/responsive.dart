import 'package:material_ui/material_ui.dart';

const double tabletWidth = 600;
const double desktopWidth = 1024;

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletWidth;
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletWidth &&
      MediaQuery.sizeOf(context).width < desktopWidth;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopWidth;
}
