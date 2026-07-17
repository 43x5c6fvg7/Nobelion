import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/splash_screen.dart';

class NobelionApp extends StatelessWidget {
  const NobelionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nobelion',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}