import 'package:api_integration_with_design/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';

import 'IntegrationScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavigationBarScreen()
    );
  }
}
