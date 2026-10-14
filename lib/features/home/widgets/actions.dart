import 'package:material_ui/material_ui.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 16),
      child: Row(
        children: [
          FButton.icon(
            onPress: () {
              context.push('/detail');
            },
            child: Icon(FLucideIcons.arrowRight),
          ),
        ],
      ),
    );
  }
}
