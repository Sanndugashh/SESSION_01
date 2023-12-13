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
    apiKey: 'AIzaSyDo5yPKQlQILmd7STYlf1K6jNLeuHXO9JQ',
    appId: '1:204417029815:web:ea70f0b9cc747c107ddf32',
    messagingSenderId: '204417029815',
    projectId: 'appedu-ff1bd',
    authDomain: 'appedu-ff1bd.firebaseapp.com',
    storageBucket: 'appedu-ff1bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKvq1NBnVvaIeYtP04Y8wiTVsgchE3C9Q',
    appId: '1:204417029815:android:776aa7be21fdc5af7ddf32',
    messagingSenderId: '204417029815',
    projectId: 'appedu-ff1bd',
    storageBucket: 'appedu-ff1bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByYFyvZQlq-zKSivCPxjx1X4SkjpOF29E',
    appId: '1:204417029815:ios:cb3f12861bcb092d7ddf32',
    messagingSenderId: '204417029815',
    projectId: 'appedu-ff1bd',
    storageBucket: 'appedu-ff1bd.appspot.com',
    iosBundleId: 'com.example.flutterEducation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByYFyvZQlq-zKSivCPxjx1X4SkjpOF29E',
    appId: '1:204417029815:ios:307b9ead5977b4ba7ddf32',
    messagingSenderId: '204417029815',
    projectId: 'appedu-ff1bd',
    storageBucket: 'appedu-ff1bd.appspot.com',
    iosBundleId: 'com.example.flutterEducation.RunnerTests',
  );
}
