import 'dart:developer' as dev;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import '../../common/other/typedefs.dart';

class CustomRemoteConfig {
  const CustomRemoteConfig._();

  /// Singleton instance of CustomRemoteConfig Helper
  static CustomRemoteConfig? _instance;

  /// Get instance of this class
  static CustomRemoteConfig get instance =>
      _instance ??= const CustomRemoteConfig._();

  static FirebaseRemoteConfig? _remoteConfig;

  static Future<void> initialize(
      [JSON defaultParameters = const <String, dynamic>{}]) async {
    _remoteConfig ??= FirebaseRemoteConfig.instance;

    await _remoteConfig!.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await _remoteConfig!.setDefaults(defaultParameters);
    RemoteConfigValue(null, ValueSource.valueStatic);
    _remoteConfig!.fetchAndActivate();
  }

  /// Returns a Map of all Remote Config parameters.
  Map<String, RemoteConfigValue> getAll() {
    if (kDebugMode) {
      dev.log(
          name: runtimeType.toString(),
          '\x1B[35mGet all Remote Config parameters');
    }
    return _remoteConfig!.getAll();
  }

  /// Gets the value for a given key as a bool.
  bool getBool(String key) {
    final bool value = _remoteConfig!.getBool(key);
    _logValueConfig(key: key, value: value);
    return value;
  }

  /// Gets the value for a given key as an int.
  int getInt(String key) {
    final int value = _remoteConfig!.getInt(key);
    _logValueConfig(key: key, value: value);
    return value;
  }

  /// Gets the value for a given key as a double.
  double getDouble(String key) {
    final double value = _remoteConfig!.getDouble(key);
    _logValueConfig(key: key, value: value);
    return value;
  }

  /// Gets the value for a given key as a String.
  String getString(String key) {
    final String value = _remoteConfig!.getString(key);
    _logValueConfig(key: key, value: value);
    return value;
  }

  /// Gets the [RemoteConfigValue] for a given key.
  RemoteConfigValue getValue(String key) {
    final RemoteConfigValue value = _remoteConfig!.getValue(key);
    _logValueConfig(key: key, value: value);
    return value;
  }

  void _logValueConfig({required String key, required Object value}) {
    if (kDebugMode) {
      dev.log(
          name: '$runtimeType',
          '\x1B[35mKEY: $key => VALUE: $value => TYPE: ${value.runtimeType}');
    }
  }
}
