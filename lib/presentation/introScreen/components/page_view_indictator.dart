import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_flutter/data/datasources/local/sharedStore.dart';
import 'package:telegram_flutter/presentation/globalWidgets/pageIndicator/smooth_page_indicator.dart';
import 'package:telegram_flutter/common/router.dart';
import 'package:telegram_flutter/presentation/introScreen/intro_screen.dart';

import '../../globalWidgets/pageIndicator/effects/jumping_dot_effect.dart';

class PageViewIndictator extends StatelessWidget {
  final int count;
  final PageController pageController;

  const PageViewIndictator(
      {Key? key, required this.pageController, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        page != 0
            ? ElevatedButton(
                onPressed: () {
                  if (page != 0) {
                    pageController.animateToPage(page - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  }
                },
                child: const Icon(CupertinoIcons.arrow_left))
            : const SizedBox(),
        SmoothPageIndicator(
          controller: pageController,
          count: count,
          effect: const JumpingDotEffect(),
        ),
        ElevatedButton(
          onPressed: () {
            if (page == count - 1) {
              Navigator.pushReplacementNamed(
                  context,
                  SharedStore.getString(userName).isNotEmpty
                      ? chatPageRoute
                      : loginRoute);
            } else {
              pageController.animateToPage(page + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            }
          },
          child: Icon(page == count - 1
              ? CupertinoIcons.check_mark
              : CupertinoIcons.arrow_right),
        )
      ],
    );
  }
}
