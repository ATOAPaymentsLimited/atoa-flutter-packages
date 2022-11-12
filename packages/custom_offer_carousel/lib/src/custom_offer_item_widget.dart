import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_offer_carousel/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomOffersItemWidget extends StatelessWidget {
  final String imageUrl;

  final VoidCallback onTap;
  final bool disableAnimationsForTest;

  const CustomOffersItemWidget({
    Key? key,
    required this.imageUrl,
    required this.onTap,
    this.disableAnimationsForTest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, dynamic error) {
                  return Shimmer.fromColors(
                    enabled: !disableAnimationsForTest,
                    direction: ShimmerDirection.ltr,
                    baseColor: CustomColors.lightGrey,
                    highlightColor: CustomColors.lightGrey.withOpacity(0.05),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    enabled: !disableAnimationsForTest,
                    direction: ShimmerDirection.ltr,
                    baseColor: CustomColors.lightGrey,
                    highlightColor: CustomColors.lightGrey.withOpacity(0.05),
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
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  onTap: onTap,
                  splashColor: CustomColors.lightestBlue.withOpacity(0.22),
                ),
              ),
            ],
          ),
        ),
      );
}
