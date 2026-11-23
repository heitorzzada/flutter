import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/home_page.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Nota: Firebase.initializeApp: $e');
  }

  runApp(const CineMelhadoApp());
}

class CineMelhadoApp extends StatelessWidget {
  const CineMelhadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineMelhado Vídeo Locadora',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
