import 'package:flutter/material.dart';

import '../../../../data/list_of_games.dart';
import '../../../../data/profiles_girl.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              profilesGirl[index]['img'],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: profilesGirl[index]['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ', ${profilesGirl[index]['age']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ])),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Recently Active',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: List.generate(profilesGirl[index]['likesID'].length,
                      (index) {
                    int indexOfGame =
                        profilesGirl[this.index]['likesID'][index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        listOfGames[indexOfGame]['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 60,
            right: 20,
            child: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
