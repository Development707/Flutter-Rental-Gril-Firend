import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../router/router.dart';
import '../../../router/routing.dart';
import '../../../shared/common/common.dart';
import '../../../shared/services/service.dart';

class NotificationService {
  const NotificationService._();

  static Future<void> initialize() async {
    await CustomMessaging.instance.requestPermission();
    _onInitialMessage(await CustomMessaging.instance.getInitialMessage());

    CustomMessaging.onMessage.listen(_onMessage);
    CustomMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static void _onMessage(RemoteMessage message) {}

  static void _onMessageOpenedApp(RemoteMessage message) {}

  static void _onInitialMessage(RemoteMessage? message) {
    if (message != null) {
      Routing.navigatorKey.currentContext!.goRouter.go(Routes.notification);
    }
  }
}
