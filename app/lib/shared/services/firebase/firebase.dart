/*
Document https://firebase.flutter.dev/docs/overview/

Install and config firebase-core with CLI tools
```terminal
dart pub global activate flutterfire_cli
npm install -g firebase-tools
firebase login
flutterfire configure -a "com.dyno.girl_friend.dev" -i "com.dyno.girl_friend.dev" -o "lib/config/firebase_options.dev.dart" 
``` 
*/

export 'firebase_analytics.dart';
export 'firebase_crashlytics.dart';
export 'firebase_dynamic_link.dart';
export 'firebase_messaging.dart';
export 'firebase_remote_config.dart';
