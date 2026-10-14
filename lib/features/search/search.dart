import 'package:app/core/extensions/extensions.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: .transparency,
      child: FScaffold(
        childPad: false,
        header: FHeader(title: Text(context.l10n.search)),
        child: SizedBox(),
      ),
    );
  }
}
