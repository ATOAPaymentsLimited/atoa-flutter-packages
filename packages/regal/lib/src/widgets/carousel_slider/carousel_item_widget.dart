import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:regal/regal.dart';
import 'package:shimmer/shimmer.dart';

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.disableAnimationsForTest = false,
    this.padding,
  });

  final String imageUrl;
  final VoidCallback? onTap;
  final bool disableAnimationsForTest;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.all(4),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget: (_, __, ___) => Shimmer.fromColors(
                enabled: !disableAnimationsForTest,
                baseColor: context.grey.shade20,
                highlightColor: context.grey.shade20.withOpacity(0.05),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
              placeholder: (_, __) => ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Shimmer.fromColors(
                  enabled: !disableAnimationsForTest,
                  baseColor: context.grey.shade20,
                  highlightColor: context.grey.shade20.withOpacity(0.05),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onTap,
              splashColor: RegalColors.vividRed.withOpacity(0.22),
            ),
          ],
        ),
      );
}
