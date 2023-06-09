import 'package:flutter/material.dart';
import 'package:gacha_gamer/constants.dart';

ThemeData buildDefaultTheme(){
  return ThemeData(
    scaffoldBackgroundColor: kSecondaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        padding: const EdgeInsets.all(kDefaultPadding),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: kTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: kTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: kTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: kTextLightColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: kTextLightColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        color: kTextLightColor,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 20,
        color: kTextLightColor,
      ),
    ),
  );
}