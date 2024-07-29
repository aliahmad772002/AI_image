import 'package:ai_image/screens/onboarding.dart';
import 'package:ai_image/screens/splash_screen.dart';
import 'package:ai_image/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: bgcolor,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0.0),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
