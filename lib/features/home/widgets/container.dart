import 'package:material_ui/material_ui.dart';
import 'package:forui/forui.dart';
import 'package:shimmer/shimmer.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: .symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: theme.colors.muted,
        highlightColor: theme.colors.muted.withValues(alpha: 0.75),
        child: Column(
          spacing: 8,
          crossAxisAlignment: .start,
          children: [
            Container(
              height: 48,
              width: 220,
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: .circular(8),
              ),
            ),
            Container(
              height: 16,
              width: 160,
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: .circular(8),
              ),
            ),
            Container(
              height: 24,
              width: 220,
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: .circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
