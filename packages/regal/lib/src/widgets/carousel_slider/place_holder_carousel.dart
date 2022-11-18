import 'package:flutter/material.dart';
import 'package:regal/regal.dart';
import 'package:shimmer/shimmer.dart';

class PlaceHolderCarousel extends StatelessWidget {
  const PlaceHolderCarousel({
    super.key,
    required this.aspectRatio,
    this.disableAnimationsForTest = false,
  });

  final double aspectRatio;
  final bool disableAnimationsForTest;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Shimmer.fromColors(
            enabled: !disableAnimationsForTest,
            baseColor: RegalColors.grey.shade20,
            highlightColor: RegalColors.grey.shade20.withOpacity(0.05),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
