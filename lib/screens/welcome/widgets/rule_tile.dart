import 'package:flutter/material.dart';

import '../../../constants.dart';

class RuleTile extends StatelessWidget {
  const RuleTile({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding,),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: const Icon(
              Icons.check,
              color: kPrimaryColor,
              size: defaultIconSize,
            ),
            title: Text(
              welcome[index]['title']!,
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
            ),
          ),
          Text(
            welcome[index]['text']!,
            style: Theme
                .of(context)
                .textTheme
                .labelMedium,
          ),
        ],
      ),
    );
  }
}