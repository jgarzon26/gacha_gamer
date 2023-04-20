import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/proceed_button.dart';
import 'package:gacha_gamer/providers/gender_provider.dart';

import '../../constants.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int? selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    const gender = ["Women", "Men", "I Like Everyone"];

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
              "Who do you like?",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.left,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (selectedIndex == index)
                          ? Colors.purple[600]
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(
                          color: (selectedIndex == index)
                              ? Colors.transparent
                              : Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() => selectedIndex = index);
                    },
                    child: Text(
                      gender[index].toUpperCase(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: (selectedIndex == index)
                                ? Colors.white
                                : Colors.black,
                          ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 3,
          ),
          ProceedButton(
            onPressed: selectedIndex == null
                ? null
                : () {
                    GenderProvider().setGender(selectedIndex!);
                    Navigator.pushNamed(context, "/gameSelection");
                  },
            text: "Continue",
          ),
        ],
      ),
    );
  }
}
