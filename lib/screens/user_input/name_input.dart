import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/user_input.dart';
import '../../providers/user_name_provider.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  void setNameToProvider(BuildContext context, String name) {
    UserNameProvider().setName(name);
    Navigator.pushNamed(context, '/ageInput');
  }

  @override
  Widget build(BuildContext context) {
    return UserInput(
      titlePage: "What is your name?",
      hintText: "Name",
      textFieldDesc: "This is how it will appear in Gacha Gamer and you will not be able to change it",
      buttonText: "Next",
      setNameToProvider: setNameToProvider,
    );
  }
}
