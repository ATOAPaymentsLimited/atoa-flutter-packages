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
  });

  final String imageUrl;
  final VoidCallback? onTap;
  final bool disableAnimationsForTest;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, dynamic error) {
                  return Shimmer.fromColors(
                    enabled: !disableAnimationsForTest,
                    baseColor: RegalColors.grey.shade20,
                    highlightColor: RegalColors.grey.shade20.withOpacity(0.05),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    enabled: !disableAnimationsForTest,
                    baseColor: RegalColors.grey.shade20,
                    highlightColor: RegalColors.grey.shade20.withOpacity(0.05),
                    child: AspectRatio(
                      aspectRatio: 2.358,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: onTap,
                  splashColor: RegalColors.celticBlue.withOpacity(0.22),
                ),
              ),
            ],
          ),
        ),
      );
}
