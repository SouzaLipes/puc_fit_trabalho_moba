import 'package:flutter/material.dart';
import 'package:puclifters/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/loginpage",
      routes: {"/loginpage": (context) => const LoginPage()},
    );
  }
}
