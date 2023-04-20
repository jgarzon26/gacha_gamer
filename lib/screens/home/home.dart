import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gacha_gamer/constants.dart';
import 'package:gacha_gamer/data/NavHomeIcons.dart';
import 'package:gacha_gamer/data/profiles_girl.dart';
import 'package:gacha_gamer/screens/home/pages/match_page/match_page.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.selectedIds}) : super(key: key);

  final List<int> selectedIds;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  final List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;

  @override
  void initState() {
    for (int i = 0; i < profilesGirl.length; i++) {
      for (int j = 0; j < widget.selectedIds.length; j++) {
        if (widget.selectedIds.contains(profilesGirl[i]["likesID"][j])) {
          _swipeItems.add(
            SwipeItem(
              content: MatchPage(
                index: i,
              ),
              likeAction: () {},
            ),
          );
        }
      }
    }
    _matchEngine = MatchEngine(
      swipeItems: _swipeItems,
    );
    super.initState();
  }

  @override
  void dispose() {
    _matchEngine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            navHomeIcons.length,
            (index) => IconButton(
              onPressed: () {
                setState(() {
                  currentPageIndex = index;
                });
              },
              icon: SvgPicture.asset(
                (currentPageIndex == index)
                    ? navHomeIcons[index]["active"]!
                    : navHomeIcons[index]["inactive"]!,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SwipeCards(
            matchEngine: _matchEngine,
            onStackFinished: () {},
            itemBuilder: (context, index) {
              return _swipeItems[index].content;
            },
            upSwipeAllowed: false,
          ),
        ),
      ),
    );
  }
}
