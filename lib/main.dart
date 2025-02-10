import 'package:flutter/material.dart';
// import 'pages/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/forget_password_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      home: ForgetPasswordPage(),
    );
  }
}
