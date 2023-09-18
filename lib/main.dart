import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostelhero/features/logs/splash_screen.dart';
import 'package:hostelhero/firebase_options.dart';
import 'package:hostelhero/settings/change_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
