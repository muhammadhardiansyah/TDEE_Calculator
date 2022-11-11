import 'package:flutter/material.dart';
import 'package:tdee_calculator/screens/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF2B4257),
        scaffoldBackgroundColor: const Color(0xFF2B4257),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2B4257),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      home: InputPage(),
    );
  }
}
