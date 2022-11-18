import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    super.key,
    required this.count,
    required this.currentOfferIndexNotifier,
    this.options = const IndicatorOptions(),
  });

  final int count;
  final ValueNotifier<int> currentOfferIndexNotifier;
  final IndicatorOptions options;

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
                  isCurrent ? options.activeSize : options.inactiveSize;
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
