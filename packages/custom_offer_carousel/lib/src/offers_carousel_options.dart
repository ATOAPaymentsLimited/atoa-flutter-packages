import 'package:flutter/material.dart';

class OffersCarouselOptions {
  /// It makes the carousel scrolling automatically
  final bool autoScroll;

  /// Aspect Ratio is used if no height is defined.
  ///
  /// Default to 5/2
  final double aspectRatio;

  /// The fraction of the viewport that each offer's page should occupy.
  ///
  /// Default to 0.92
  final double viewportFraction;

  /// The animation duration between two transitioning pages while in auto playback.
  ///
  /// Default to 200 ms
  final Duration animationDuration;

  const OffersCarouselOptions({
    Key? key,
    this.autoScroll = true,
    this.aspectRatio = 2.5,
    this.viewportFraction = 0.92,
    this.animationDuration = const Duration(milliseconds: 200),
  });
}
