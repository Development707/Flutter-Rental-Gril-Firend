import 'package:firebase_core/firebase_core.dart';

import 'app/my_app.dart';
import 'config/bootstrap.dart';
import 'config/firebase_options.prod.dart';

void main() {
  bootstrap(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    return const MyApp();
  });
}
