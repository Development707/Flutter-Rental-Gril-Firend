import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../shared/services/service.dart';
import 'dependency_container.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    dev.log(
      name: '${bloc.runtimeType}',
      '\x1B[37m${(change.currentState as Object).runtimeType} \u{2771}\u{27A4} ${(change.nextState as Object).runtimeType}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    dev.log(
      name: '${bloc.runtimeType}',
      '\x1B[31mAPP BLOC OBSERVER',
      error: error,
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      final WidgetsBinding widgetsBinding =
          WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      final Widget app = await builder();

      await CustomCrashlytics.initialize();
      await CustomRemoteConfig.initialize();
      await CustomMessaging.initialize();
      await CustomDynamicLink.initialize();

      if (kDebugMode) {
        Bloc.observer = AppBlocObserver();
      }
      await KeyValueStorageBase.initialize();
      await resolveDependencies();

      runApp(app);
    },
    CustomCrashlytics.instance.recordError,
  );
}
