import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<ShareResult?> share(ShareParams params) async {
  try {
    return await SharePlus.instance.share(params);
  } catch (exc, st) {
    GetIt.I<Talker>().error(exc, st);
    return null;
  }
}
