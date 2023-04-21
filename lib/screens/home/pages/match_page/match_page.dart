import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../../constants.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({
    super.key,
    required MatchEngine matchEngine,
    required List<SwipeItem> swipeItems,
  })  : _matchEngine = matchEngine,
        _swipeItems = swipeItems;

  final MatchEngine _matchEngine;
  final List<SwipeItem> _swipeItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
