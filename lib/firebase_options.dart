// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyA0tzR-2mjMyYuY8M5hOYQ97-HoDDpd22k',
    appId: '1:1053146613921:web:8918b2d04c6092eebb48e0',
    messagingSenderId: '1053146613921',
    projectId: 'ecommerce-application-557f2',
    authDomain: 'ecommerce-application-557f2.firebaseapp.com',
    storageBucket: 'ecommerce-application-557f2.appspot.com',
    measurementId: 'G-CYF7ZJV24Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1DOYbXOau1BzE5hSu3_pavkh__XuS1ak',
    appId: '1:1053146613921:android:9c2a2fa97aec0e5abb48e0',
    messagingSenderId: '1053146613921',
    projectId: 'ecommerce-application-557f2',
    storageBucket: 'ecommerce-application-557f2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbrCm1P4l-yRmINipX9LRb9dm-ibcUajE',
    appId: '1:1053146613921:ios:8278e5945098f067bb48e0',
    messagingSenderId: '1053146613921',
    projectId: 'ecommerce-application-557f2',
    storageBucket: 'ecommerce-application-557f2.appspot.com',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbrCm1P4l-yRmINipX9LRb9dm-ibcUajE',
    appId: '1:1053146613921:ios:777ac3ef7f5c79cbbb48e0',
    messagingSenderId: '1053146613921',
    projectId: 'ecommerce-application-557f2',
    storageBucket: 'ecommerce-application-557f2.appspot.com',
    iosBundleId: 'com.example.ecommerceapp.RunnerTests',
  );
}