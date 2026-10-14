import 'package:app/core/utils/responsive.dart';
import 'package:material_ui/material_ui.dart';

class ResponsiveChild extends StatelessWidget {
  const ResponsiveChild({
    super.key,
    required this.mobile,
    required this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return mobile;
    } else if (Responsive.isTablet(context)) {
      return tablet;
    } else if (Responsive.isDesktop(context)) {
      return desktop ?? tablet;
    }
    return SizedBox();
  }
}
