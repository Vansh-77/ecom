import 'package:app/home_page.dart';
import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            fillColor: const Color.fromARGB(255, 0, 40, 73),
            filled: true,
          )),
      routes: {
        "/": (context) => const Homepage(),
        "/login": (context) => const Loginpage(),
        "/homepage": (context) => const Homepage(),
      },
    );
  }
}
