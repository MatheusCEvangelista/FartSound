import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const FartApp());
}

class FartApp extends StatelessWidget {
  const FartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fart Sounds App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(fontSize: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.green[300],
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
