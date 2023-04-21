import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gacha_gamer/data/NavHomeIcons.dart';
import 'package:gacha_gamer/data/profiles_girl.dart';
import 'package:gacha_gamer/providers/gender_provider.dart';
import 'package:gacha_gamer/screens/home/pages/likes_page/likes_page.dart';
import 'package:gacha_gamer/screens/home/pages/match_page/match_page.dart';
import 'package:gacha_gamer/screens/home/pages/match_page/widgets/profile_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../data/profiles_boy.dart';

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
  late List<Map<String, dynamic>> profiles;

  @override
  void initState() {
    switch (GenderProvider().value) {
      case GenderSelect.female:
        profiles = profilesGirl;
        break;
      case GenderSelect.male:
        profiles = profilesBoy;
        break;
      case GenderSelect.both:
        profiles = [...profilesGirl, ...profilesBoy];
        break;
    }

    for (int i = 0; i < profiles.length; i++) {
      for (int j = 0; j < profiles[i]['likesID'].length; j++) {
        if (widget.selectedIds.contains(profiles[i]["likesID"][j])) {
          _swipeItems.add(
            SwipeItem(
              content: ProfileCard(
                index: i,
                profiles: profiles,
              ),
              likeAction: () {},
            ),
          );
          break;
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
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          MatchPage(matchEngine: _matchEngine, swipeItems: _swipeItems),
          LikePage(
            profiles: profiles,
          ),
        ],
      ),
    );
  }
}
