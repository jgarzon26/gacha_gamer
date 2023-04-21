import 'package:flutter/material.dart';
import 'package:gacha_gamer/components/proceed_button.dart';
import 'package:gacha_gamer/data/list_of_games.dart';

import '../../constants.dart';
import '../home/Home.dart';

class GameSelection extends StatefulWidget {
  const GameSelection({Key? key}) : super(key: key);

  @override
  State<GameSelection> createState() => _GameSelectionState();
}

class _GameSelectionState extends State<GameSelection> {
  List<int> indexesSelected = [];

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  'What do you like to play?',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: kDefaultPadding),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find your game',
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: kDefaultPadding),
            ),
            SliverGrid.builder(
              itemCount: listOfGames.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 4,
                          color: indexesSelected.contains(index)
                              ? Colors.purple[600]!
                              : Colors.transparent,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (indexesSelected.contains(index)) {
                              indexesSelected.remove(index);
                            } else {
                              indexesSelected.add(index);
                            }
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            listOfGames[index]['img']!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        listOfGames[index]['name']!,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: kDefaultPadding),
            ),
            SliverToBoxAdapter(
              child: ProceedButton(
                text: 'Continue',
                onPressed: indexesSelected.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(
                              selectedIds: indexesSelected,
                            ),
                          ),
                        );
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
