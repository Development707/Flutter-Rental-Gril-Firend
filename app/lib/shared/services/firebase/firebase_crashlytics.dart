import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CustomCrashlytics {
  const CustomCrashlytics._();

  /// Singleton instance of CustomDynamicLink Helper
  static CustomCrashlytics? _instance;

  /// Get instance of this class
  static CustomCrashlytics get instance =>
      _instance ??= const CustomCrashlytics._();

  static FirebaseCrashlytics? _crashlytics;

  static Future<void> initialize() async {
    _crashlytics ??= FirebaseCrashlytics.instance;

    await _crashlytics!.setCrashlyticsCollectionEnabled(!kDebugMode);
    FlutterError.onError = _crashlytics!.recordFlutterError;
  }

  Future<void> recordError(dynamic exception, StackTrace? stack) async {
    _crashlytics!.recordError(exception, stack);
  }
}
