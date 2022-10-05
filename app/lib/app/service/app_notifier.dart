import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../config/dependency_container.dart';
import '../../features/authentication/authentication.dart';

class AppNotifier extends ChangeNotifier {
  AppNotifier() : _authBloc = getIt<AuthenticationBloc>() {
    notifyListeners();

    _authBloc.stream.asBroadcastStream().listen((AuthenticationState state) {
      notifyListeners();
      Future<void>.delayed(
          const Duration(milliseconds: 500), FlutterNativeSplash.remove);
    });
  }

  final AuthenticationBloc _authBloc;
}
