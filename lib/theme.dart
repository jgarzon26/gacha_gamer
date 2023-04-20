import 'package:flutter/material.dart';
import 'package:gacha_gamer/constants.dart';

ThemeData buildDefaultTheme(){
  return ThemeData(
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
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: kTextLightColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        color: kTextLightColor2,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: kTextLightColor2,
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