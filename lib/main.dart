import 'package:color_changer/screen_changes/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chameleon app',
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}
