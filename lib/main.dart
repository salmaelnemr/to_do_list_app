import 'package:flutter/material.dart';
import 'features/splash/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: const Color(0xFF6C63FF),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}