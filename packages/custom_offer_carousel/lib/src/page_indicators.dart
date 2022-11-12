import 'package:flutter/material.dart';

import 'offers_indicator_options.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    Key? key,
    required this.count,
    required this.currentOfferIndexNotifier,
    this.options = const OffersIndicatorOptions(),
  }) : super(key: key);

  final int count;
  final ValueNotifier<int> currentOfferIndexNotifier;
  final OffersIndicatorOptions options;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (index) => ValueListenableBuilder<int>(
            valueListenable: currentOfferIndexNotifier,
            builder: (_, currentIndex, __) {
              final isCurrent = currentIndex == index;
              final size =
                  (isCurrent ? options.activeSize : options.inactiveSize);
              return AnimatedContainer(
                width: size,
                height: size,
                duration: options.animationDuration,
                margin: options.margin,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isCurrent ? options.activeColor : options.inactiveColor,
                ),
              );
            },
          ),
        ),
      );
}
