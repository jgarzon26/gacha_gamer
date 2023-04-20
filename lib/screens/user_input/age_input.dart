import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/user_input.dart';
import 'package:gacha_gamer/providers/user_age_provider.dart';

class AgeInput extends StatelessWidget {
  const AgeInput({Key? key}) : super(key: key);

  void setAgeToProvider(BuildContext context, String age) {
    UserAgeProvider().setAge(int.parse(age));
    Navigator.pushNamed(context, '/gender');
  }

  @override
  Widget build(BuildContext context) {
    return UserInput(
      titlePage: "What is your age?",
      hintText: "Age",
      textFieldDesc: "Your age will be public",
      buttonText: "Continue",
      setNameToProvider: setAgeToProvider,
      isStringInput: false,
    );
  }
}