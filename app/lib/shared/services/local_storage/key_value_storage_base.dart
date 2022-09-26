import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_box.dart';

/// Base class containing a unified API for key-value pairs' storage.
/// This class provides low level methods for storing:
/// - Sensitive keys using [FlutterSecureStorage]
/// - Insensitive keys using [HiveInterface]
class KeyValueStorageBase {
  /// Private constructor
  const KeyValueStorageBase._();

  /// Instance of flutter secure storage
  static FlutterSecureStorage? _secureStorage;

  /// Singleton instance of KeyValueStorage Helper
  static KeyValueStorageBase? _instance;

  /// Get instance of this class
  static KeyValueStorageBase get instance =>
      _instance ??= const KeyValueStorageBase._();

  /// Initializer for shared prefs and flutter secure storage
  /// Should be called in main before runApp and
  /// after WidgetsBinding.FlutterInitialized(), to allow for synchronous tasks
  /// when possible.
  static Future<void> initialize() async {
    // Hive initialize
    await Hive.initFlutter();

    // FlutterSecureStorage initialize
    _secureStorage ??= const FlutterSecureStorage();
  }

  /// Reads the decrypted value for the key from secure storage
  Future<String?> getEncrypted(String key) {
    try {
      return _secureStorage!.read(key: key);
    } on PlatformException {
      return Future<String?>.value();
    }
  }

  /// Sets the encrypted value for the key to secure storage
  Future<bool> setEncrypted(String key, String value) {
    try {
      _secureStorage!.write(key: key, value: value);
      return Future<bool>.value(true);
    } on PlatformException catch (_) {
      return Future<bool>.value(false);
    }
  }

  /// Erases encrypted keys
  Future<void> clearEncrypted() => _secureStorage!.deleteAll();

  /* ------------------ HIVE STORAGE ----------------------- */

  /// Returns true if there is at least one entries in this box.
  bool hasData<T extends HiveBox>() {
    return Hive.box<HiveBox>(T.runtimeType.toString()).isNotEmpty;
  }

  /// Returns the value associated with the given [key]. If the key does not
  /// exist, `null` is returned.
  T? getItem<T extends HiveBox>({required dynamic key}) {
    try {
      final Box<T> hiveBox = Hive.box<T>(T.runtimeType.toString());

      return hiveBox.get(key);
    } on Exception {
      return null;
    }
  }

  /// Read the value for the key from common hive storage
  Iterable<T>? getItems<T extends HiveBox>({int page = 1, int? limit}) {
    try {
      final Box<T> hiveBox = Hive.box<T>(T.runtimeType.toString());
      final int totalHiveItems = hiveBox.length;

      int itemCount = totalHiveItems;
      int start = 0;

      if (limit != null) {
        start = (page - 1) * limit;
        itemCount = min(totalHiveItems - start, limit);
      }

      final Iterable<T> items = Iterable<T?>.generate(
              itemCount, (int index) => hiveBox.getAt(start + index))
          .whereType<T>();

      return items;
    } on Exception {
      return null;
    }
  }

  /// Sets the value for the key (id) to common hive storage
  Future<void> saveItem<T extends HiveBox>(
      {required dynamic key, dynamic value}) async {
    final Box<dynamic> hiveBox = Hive.box<dynamic>(T.runtimeType.toString());

    await hiveBox.put(key, value);
  }

  /// Saves all the [values] with id keys.
  Future<void> saveItems<T extends HiveBox>(
      {required Iterable<T> items, bool clear = true}) async {
    final Box<dynamic> hiveBox = Hive.box<dynamic>(T.runtimeType.toString());

    if (clear) {
      await hiveBox.clear();
    }

    final Map<dynamic, T> itemsMap = <dynamic, T>{
      for (T item in items) item.id: item
    };

    await hiveBox.putAll(itemsMap);
  }

  /// Erases hive storage keys
  Future<void> clearBox() => Hive.deleteFromDisk();
}
