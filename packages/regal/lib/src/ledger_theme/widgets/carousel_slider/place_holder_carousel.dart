import 'package:flutter/material.dart';
import 'package:regal/src/ledger_theme/ledger_theme.dart';
import 'package:regal/src/spacing/spacing.dart';
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
        padding: Spacing.lds100.y +
            Spacing.lds250.left +
            Spacing.lds100.right,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Shimmer.fromColors(
            enabled: !disableAnimationsForTest,
            baseColor: context.grey.shade400,
            highlightColor: context.grey.shade400.withOpacity(0.05),
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
