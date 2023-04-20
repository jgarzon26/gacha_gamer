import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/proceed_button.dart';
import 'package:gacha_gamer/constants.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {

  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    const defaultPadding = EdgeInsets.symmetric(horizontal: 50);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: defaultIconSize,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Text(
              'What is your name?',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('This is how it will appear in Gacha Gamer and you will not be able to change it',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          ProceedButton(
            onPressed: (){},
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
