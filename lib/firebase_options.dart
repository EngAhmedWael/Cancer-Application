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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDcBYiqzYeYG2UsafNNJjlg7eFaoth8Z_U',
    appId: '1:361770876181:web:5ffd041590b327e5d83d1c',
    messagingSenderId: '361770876181',
    projectId: 'myapp-384e3',
    authDomain: 'myapp-384e3.firebaseapp.com',
    storageBucket: 'myapp-384e3.appspot.com',
    measurementId: 'G-WEZMQQFM2T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvUBBeZ2gKGMx1wH_bSpVQylShfPxndGU',
    appId: '1:361770876181:android:3da2830311be62cdd83d1c',
    messagingSenderId: '361770876181',
    projectId: 'myapp-384e3',
    storageBucket: 'myapp-384e3.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4TlLodqqHXIaClIH77LZL93FCqkQ1wYE',
    appId: '1:361770876181:ios:121cb17306a96282d83d1c',
    messagingSenderId: '361770876181',
    projectId: 'myapp-384e3',
    storageBucket: 'myapp-384e3.appspot.com',
    androidClientId: '361770876181-j66tlq70akrge8rovsf9bkr1rmngqbm2.apps.googleusercontent.com',
    iosBundleId: 'com.example.cancer',
  );
}
