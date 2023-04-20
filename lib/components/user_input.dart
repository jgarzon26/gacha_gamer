import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/proceed_button.dart';
import 'package:gacha_gamer/constants.dart';
import 'package:gacha_gamer/providers/user_name_provider.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key,
    required this.titlePage,
    required this.hintText,
    required this.textFieldDesc,
    required this.buttonText,
    required this.setNameToProvider,
    this.isStringInput
  }) : super(key: key);

  final String titlePage, hintText, textFieldDesc, buttonText;
  final bool? isStringInput;
  final void Function(BuildContext, String) setNameToProvider;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {

  late TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
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
              widget.titlePage,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: Column(
              children: [
                TextField(
                  controller: _inputController,
                  keyboardType: widget.isStringInput == null || widget.isStringInput == true ? TextInputType.text : TextInputType.number,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.textFieldDesc,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          ProceedButton(
            onPressed: () => widget.setNameToProvider(context, _inputController.text),
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
