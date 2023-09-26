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
    apiKey: 'AIzaSyBSyhm_hhiMRVU0jBFpb04bfCujYx1emFI',
    appId: '1:956848063038:web:6d32192304ce628008476f',
    messagingSenderId: '956848063038',
    projectId: 'pepcornslogin',
    authDomain: 'pepcornslogin.firebaseapp.com',
    storageBucket: 'pepcornslogin.appspot.com',
    measurementId: 'G-R1XSR4FB3S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxhXqdqSry7PQVlbaCE_lcA_MFdvBdwHg',
    appId: '1:956848063038:android:f0046170fb95337608476f',
    messagingSenderId: '956848063038',
    projectId: 'pepcornslogin',
    storageBucket: 'pepcornslogin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2K_LEumdgGJqa2aLVH-7yjeZfyqTrp-8',
    appId: '1:956848063038:ios:633ff886267783e508476f',
    messagingSenderId: '956848063038',
    projectId: 'pepcornslogin',
    storageBucket: 'pepcornslogin.appspot.com',
    iosBundleId: 'com.example.pepcorns',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2K_LEumdgGJqa2aLVH-7yjeZfyqTrp-8',
    appId: '1:956848063038:ios:ee7102ff20a1737d08476f',
    messagingSenderId: '956848063038',
    projectId: 'pepcornslogin',
    storageBucket: 'pepcornslogin.appspot.com',
    iosBundleId: 'com.example.pepcorns.RunnerTests',
  );
}