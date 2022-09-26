// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.prod.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCV3IZYMW87luFzXuyU6rJo3Vz6NW5Wz-I',
    appId: '1:786901601261:web:16106ce0844faa1054b5e4',
    messagingSenderId: '786901601261',
    projectId: 'rental-girl-friend',
    authDomain: 'rental-girl-friend.firebaseapp.com',
    storageBucket: 'rental-girl-friend.appspot.com',
    measurementId: 'G-F6NELCWEZM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEBtdOzQs6M-w52jwb_OygBtaqBBBZnLs',
    appId: '1:786901601261:android:b6db5f480746c6c954b5e4',
    messagingSenderId: '786901601261',
    projectId: 'rental-girl-friend',
    storageBucket: 'rental-girl-friend.appspot.com',
  );
}