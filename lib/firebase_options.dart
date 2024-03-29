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
    apiKey: 'AIzaSyCax3YXFWnK1GVn9BzDItsli4PKmdtNPX0',
    appId: '1:932809782630:web:3dc3c109017ebc549d04a7',
    messagingSenderId: '932809782630',
    projectId: 'database-300bf',
    authDomain: 'database-300bf.firebaseapp.com',
    databaseURL: 'https://database-300bf-default-rtdb.firebaseio.com',
    storageBucket: 'database-300bf.appspot.com',
    measurementId: 'G-DJRXQJZBW4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACizRImPGMaHiGyafMdEFc7N28OtihvxQ',
    appId: '1:932809782630:android:84d2def8a7e2de729d04a7',
    messagingSenderId: '932809782630',
    projectId: 'database-300bf',
    databaseURL: 'https://database-300bf-default-rtdb.firebaseio.com',
    storageBucket: 'database-300bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK-zSELaKp0JAd4G3i_jKlaIdZyPdTkrA',
    appId: '1:932809782630:ios:142e09b6dc20718b9d04a7',
    messagingSenderId: '932809782630',
    projectId: 'database-300bf',
    databaseURL: 'https://database-300bf-default-rtdb.firebaseio.com',
    storageBucket: 'database-300bf.appspot.com',
    iosClientId: '932809782630-f0g803fj62c7dv4rjl14fjtvmtph3nde.apps.googleusercontent.com',
    iosBundleId: 'com.dev.quizApp',
  );
}
