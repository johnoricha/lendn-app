import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const String pinKey = 'pin';
  static const fullNameKey = 'fullName';
  static const emailKey = 'email';
  static const passwordKey = 'password';

  static final LocalStorage _instance = LocalStorage._internal();
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();

  void savePin(String pin) async {
    await _storage.write(key: pinKey, value: pin);
  }

  Future<String?> getPin() async {
    final pin = await _storage.read(key: pinKey);
    return pin;
  }

  void saveFullName(String fullName) async {
    await _storage.write(key: fullNameKey, value: fullName);
  }

  Future<String?> getFullName() async {
    final fullName = await _storage.read(key: fullNameKey);

    return fullName;
  }

  void saveEmail(String email) async {
    await _storage.write(key: emailKey, value: email);
  }

  Future<String?> getEmail() async {
    final email = await _storage.read(key: emailKey);

    return email;
  }

  void savePassword(String password) async {
    await _storage.write(key: passwordKey, value: password);
  }

  Future<String?> getPassword() async {
    final password = await _storage.read(key: passwordKey);

    return password;
  }

  Future<void> deleteKeyFromStorage(String key) async {
    await _storage.delete(key: key);
  }
}
