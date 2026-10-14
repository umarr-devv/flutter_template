import 'package:app/core/extensions/extensions.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      childPad: false,
      header: FHeader.nested(
        prefixes: [
          FButton.icon(
            onPress: () {
              context.pop();
            },
            child: Icon(FLucideIcons.arrowLeft),
          ),
        ],
        title: Text(context.l10n.detail),
        titleAlignment: .centerLeft,
      ),
      child: SizedBox(),
    );
  }
}
