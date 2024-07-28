import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rate Tracker',
      theme: const AppTheme().toThemeData(),
      home: const HomePage(),
    );
  }
}
