import 'package:app/core/extensions/extensions.dart';
import 'package:app/core/utils/utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:forui/forui.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

class HomeAppInfo extends StatefulWidget {
  const HomeAppInfo({super.key});

  @override
  State<HomeAppInfo> createState() => _HomeAppInfoState();
}

class _HomeAppInfoState extends State<HomeAppInfo>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);

  bool hide = false;

  @override
  Widget build(BuildContext context) {
    final packageinfo = GetIt.I<PackageInfo>();
    return Container(
      width: .infinity,
      padding: .symmetric(horizontal: 16),
      child: FCard(
        child: Container(
          padding: .all(16),
          child: Column(
            spacing: 16,
            children: [
              FButton(
                onPress: () {
                  if (hide) {
                    _controller.forward();
                    hide = false;
                  } else {
                    _controller.reverse();
                    hide = true;
                  }
                },
                prefix: Icon(FLucideIcons.toggleLeft),
                child: Text(context.l10n.toggle),
              ),
              Column(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .start,
                    children: [
                      FLabel(
                        label: Text(context.l10n.appName),
                        layout: .vertical,
                        child: Text(packageinfo.appName),
                      ),
                      FButton.icon(
                        onPress: () {
                          share(ShareParams(text: packageinfo.appName));
                        },
                        child: Icon(FLucideIcons.share2),
                      ),
                    ],
                  ),
                  FDivider(),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      FLabel(
                        label: Text(context.l10n.packageName),
                        layout: .vertical,
                        child: Text(packageinfo.packageName),
                      ),
                      FButton.icon(
                        onPress: () {
                          onLaunchUrl('https://google.com');
                        },
                        child: Icon(FLucideIcons.link),
                      ),
                    ],
                  ),
                  FDivider(),
                  FLabel(
                    label: Text(context.l10n.version),
                    layout: .vertical,
                    child: Text(packageinfo.version),
                  ),
                  FDivider(),
                  FLabel(
                    label: Text(context.l10n.buildNumber),
                    layout: .vertical,
                    child: Text(packageinfo.buildNumber),
                  ),
                ],
              ).animate(controller: _controller).fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}
