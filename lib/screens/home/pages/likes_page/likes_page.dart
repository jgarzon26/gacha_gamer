import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/proceed_button.dart';
import 'package:gacha_gamer/constants.dart';

class LikePage extends StatelessWidget {
  const LikePage({
    Key? key,
    required this.profiles,
  }) : super(key: key);

  final List<Map<String, dynamic>> profiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Likes',
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Top Picks'),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(kDefaultPadding),
                shrinkWrap: true,
                itemCount: profiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            profiles[index]['img'],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 10,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 10,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Recently Active',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: ProceedButton(
          onPressed: () {},
          text: "SEE WHO LIKED YOU",
        ),
      ),
    );
  }
}
