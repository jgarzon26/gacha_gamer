import 'package:flutter/material.dart';
import 'package:gacha_gamer/screens/game_selection/game_selection.dart';
import 'package:gacha_gamer/screens/gender/gender.dart';
import 'package:gacha_gamer/screens/user_input/age_input.dart';
import 'package:gacha_gamer/screens/user_input/name_input.dart';
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
        //'/': (context) => const LoginMain(),
        '/': (context) => const Gender(),
        '/welcome': (context) => const Welcome(),
        '/nameInput': (context) => const NameInput(),
        '/ageInput': (context) => const AgeInput(),
        '/gender': (context) => const Gender(),
        '/gameSelection': (context) => const GameSelection(),
      },
    );
  }
}
