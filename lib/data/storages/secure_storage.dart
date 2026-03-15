import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorage {
  AndroidOptions _getAndroidOptions() => const AndroidOptions();

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  WindowsOptions _getWindowsOptions() => const WindowsOptions();

  LinuxOptions _getLinuxOptions() => const LinuxOptions();

  MacOsOptions _getMacOsOptions() => const MacOsOptions();

  WebOptions _getWebOptions() => const WebOptions();

  late final FlutterSecureStorage _storage;

  SecureStorage() {
    _storage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
      wOptions: _getWindowsOptions(),
      lOptions: _getLinuxOptions(),
      mOptions: _getMacOsOptions(),
      webOptions: _getWebOptions(),
    );
  }

  Future write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future delete(String key) async {
    await _storage.delete(key: key);
  }

  Future clear() async {
    await _storage.deleteAll();
  }
}
