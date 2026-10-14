import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future onLaunchUrl(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (exc, st) {
    GetIt.I<Talker>().error(exc, st);
  }
}
