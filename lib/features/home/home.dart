import 'package:app/features/home/widgets/widgets.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: .transparency,
      child: FScaffold(
        childPad: false,
        header: HomeHeader(),
        child: Column(
          spacing: 12,
          crossAxisAlignment: .start,
          children: [HomeAppInfo(), HomeActions(), HomeContainer()],
        ),
      ),
    );
  }
}
