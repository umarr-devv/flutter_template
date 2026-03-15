import 'package:talker_flutter/talker_flutter.dart';

class TalkerSetup {
  static Talker init() {
    return Talker(
      settings: TalkerSettings(
        enabled: true,
        useHistory: true,
        useConsoleLogs: true,
      ),
      logger: TalkerLogger(),
    );
  }
}
