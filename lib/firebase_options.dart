import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Configurações padrão do Firebase para execução direta via Flutter.
/// Substitua os valores abaixo pelas credenciais do seu projeto Firebase
/// geradas pelo FlutterFire CLI (flutterfire configure) se desejar.
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
      case TargetPlatform.windows:
        return windows;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA_DEMO_KEY_FLUTTER_FLOW_PROJECT_KEY',
    appId: '1:123456789012:web:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'vida-saudavel-tcc',
    authDomain: 'vida-saudavel-tcc.firebaseapp.com',
    storageBucket: 'vida-saudavel-tcc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_DEMO_KEY_FLUTTER_FLOW_PROJECT_KEY',
    appId: '1:123456789012:android:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'vida-saudavel-tcc',
    storageBucket: 'vida-saudavel-tcc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_DEMO_KEY_FLUTTER_FLOW_PROJECT_KEY',
    appId: '1:123456789012:ios:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'vida-saudavel-tcc',
    storageBucket: 'vida-saudavel-tcc.appspot.com',
    iosBundleId: 'com.mycompany.vidasaudavel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA_DEMO_KEY_FLUTTER_FLOW_PROJECT_KEY',
    appId: '1:123456789012:web:abcdef1234567890',
    messagingSenderId: '123456789012',
    projectId: 'vida-saudavel-tcc',
    authDomain: 'vida-saudavel-tcc.firebaseapp.com',
    storageBucket: 'vida-saudavel-tcc.appspot.com',
  );
}
