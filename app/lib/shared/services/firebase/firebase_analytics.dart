import 'package:firebase_analytics/firebase_analytics.dart';

class CustomAnalytics {
  const CustomAnalytics._();

  /// Singleton instance of CustomDynamicLink Helper
  static CustomAnalytics? _instance;

  /// Get instance of this class
  static CustomAnalytics get instance =>
      _instance ??= const CustomAnalytics._();

  static FirebaseAnalytics? _analytics;

  static FirebaseAnalyticsObserver? _observer;

  static Future<void> initialize() async {
    _analytics ??= FirebaseAnalytics.instance;
    _observer ??= FirebaseAnalyticsObserver(analytics: _analytics!);
  }
}
