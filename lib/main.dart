import 'package:flutter/material.dart';
import 'package:gacha_gamer/screens/home/home.dart';
import 'package:gacha_gamer/screens/login/login_main.dart';
import 'package:gacha_gamer/screens/welcome/welcome.dart';
import 'package:gacha_gamer/theme.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildDefaultTheme(),
      routes: {
        '/': (context) => const LoginMain(),
        '/home': (context) => const Home(),
        '/welcome' : (context) => const Welcome(),
      },
    );
  }
}