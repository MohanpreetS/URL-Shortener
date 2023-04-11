// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCphEUAwNPfa2Hw-gKG3aKsnNnMFY69x8E',
    appId: '1:70889742190:web:ea1646e5c2940d49d5eb7f',
    messagingSenderId: '70889742190',
    projectId: 'sb-diagnostics-6b790',
    authDomain: 'sb-diagnostics-6b790.firebaseapp.com',
    storageBucket: 'sb-diagnostics-6b790.appspot.com',
    measurementId: 'G-L73P0J2ZN7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnjAcWAej9XI5Dc69QPPacZIjMCOjJ6Zw',
    appId: '1:70889742190:android:b62dd024a0e44a6ed5eb7f',
    messagingSenderId: '70889742190',
    projectId: 'sb-diagnostics-6b790',
    storageBucket: 'sb-diagnostics-6b790.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLeZVWaX5btd0ClwXPcUnF9Jbs4UTI3e8',
    appId: '1:70889742190:ios:1a6b6469c2b2bd65d5eb7f',
    messagingSenderId: '70889742190',
    projectId: 'sb-diagnostics-6b790',
    storageBucket: 'sb-diagnostics-6b790.appspot.com',
    androidClientId: '70889742190-675cdktphg1u79ijvv8e54cgqs477mf2.apps.googleusercontent.com',
    iosClientId: '70889742190-i3e1k0bk79tsjdlebkjahlm77td2r82s.apps.googleusercontent.com',
    iosBundleId: 'com.example.sbAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLeZVWaX5btd0ClwXPcUnF9Jbs4UTI3e8',
    appId: '1:70889742190:ios:1a6b6469c2b2bd65d5eb7f',
    messagingSenderId: '70889742190',
    projectId: 'sb-diagnostics-6b790',
    storageBucket: 'sb-diagnostics-6b790.appspot.com',
    androidClientId: '70889742190-675cdktphg1u79ijvv8e54cgqs477mf2.apps.googleusercontent.com',
    iosClientId: '70889742190-i3e1k0bk79tsjdlebkjahlm77td2r82s.apps.googleusercontent.com',
    iosBundleId: 'com.example.sbAdmin',
  );
}
