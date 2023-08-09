import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabTitles,
    required this.onTap,
    required this.pageCtlr,
  });

  final List<String> tabTitles;
  final void Function(int index) onTap;
  final PageController pageCtlr;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: pageCtlr,
        builder: (context, child) {
          var page = 0.0;
          if (pageCtlr.hasClients) {
            page = pageCtlr.page ?? 0;
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Spacing.large.value),
              border: Border.all(color: RegalColors.grey.shade40),
            ),
            padding: EdgeInsets.all(Spacing.mini.value),
            margin: EdgeInsets.symmetric(horizontal: Spacing.xtraLarge.value),
            width: double.infinity,
            child: Row(
              children: tabTitles
                  .mapIndexed(
                    (i, e) => Expanded(
                      child: CustomGestureDetector(
                        context: context,
                        trackLabel: 'Your Invites Tab Switch',
                        semanticsLabel: '$e Tab',
                        trackProperties: <String, String>{'tab_name': e},
                        onTap: () {
                          onTap.call(i);
                          // currentIndex = i;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: page == i
                                ? RegalColors.vividRed
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              Spacing.medium.value + Spacing.tiny.value,
                            ),
                          ),
                          padding: Spacing.medium.all,
                          child: Center(
                            child: CustomText.semantics(
                              e,
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: page == i
                                    ? Colors.white
                                    : RegalColors.grey.shade40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      );
}
