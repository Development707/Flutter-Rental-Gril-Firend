class Routes {
  const Routes._();

  /// Authentication router
  static const String auth = '/authentication';
  static const String otp = '/one-time-password';

  /// Main router
  static const String home = '/home';
  static const String search = '/search';
  static const String notification = '/notification';
  static const String menu = '/menu';

  /// Other router
  static const String boarding = '/boarding';

  // Allow all permissions
  static final List<String> pageNotAuthen = <String>[
    otp,
    boarding,
  ];
}
