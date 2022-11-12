import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'colors.dart';

class OffersPlaceHolder extends StatelessWidget {
  const OffersPlaceHolder({
    Key? key,
    required this.aspectRatio,
    this.disableAnimationsForTest = false,
  }) : super(key: key);

  final double aspectRatio;
  final bool disableAnimationsForTest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Shimmer.fromColors(
          enabled: !disableAnimationsForTest,
          direction: ShimmerDirection.ltr,
          baseColor: CustomColors.lightGrey,
          highlightColor: CustomColors.lightGrey.withOpacity(0.05),
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
}
