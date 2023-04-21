import 'package:flutter/material.dart';
import 'package:gacha_gamer/constants.dart';
import 'package:gacha_gamer/screens/welcome/widgets/rule_tile.dart';

import '../../components/proceed_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close_rounded,
            size: 50,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Welcome to Gotcha",
              style: Theme.of(context).textTheme.displayMedium,
              ),
            Text(
              "Please follow these House rules",
              style: Theme.of(context).textTheme.displaySmall,
              ),
            ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50,),
                child: RuleTile(index: index),
              );
            },
              itemCount: welcome.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            ProceedButton(
              onPressed: () => Navigator.pushNamed(context, '/nameInput'),
              text: 'i agree',
            ),
          ],
        ),
      ),
    );
  }
}



