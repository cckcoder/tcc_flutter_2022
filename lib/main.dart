import 'package:flutter/material.dart';
import 'package:inventory_workshop/pages/home.dart';
import 'package:inventory_workshop/pages/login.dart';
import 'package:inventory_workshop/pages/register.dart';
import 'package:inventory_workshop/pages/stockForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/stockform': (context) => const StockFormScreen(),
        '/login': (context) => const LoginScreen()
      },
      theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold))),
      home: const LoginScreen(),
    );
  }
}
