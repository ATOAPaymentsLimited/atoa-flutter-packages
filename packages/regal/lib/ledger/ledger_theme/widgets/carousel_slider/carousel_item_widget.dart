
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:regal/ledger/ledger_theme/ledger_theme.dart';
import 'package:shimmer/shimmer.dart';

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.disableAnimationsForTest = false,
    this.padding,
  })  : title = '',
        desc = '',
        bgColor = null,
        textColor = null,
        prefixIcon = null,
        widget = null;

  const CarouselItemWidget.card({
    super.key,
    required this.title,
    required this.desc,
    required this.prefixIcon,
    this.bgColor,
    this.textColor,
    this.onTap,
    this.disableAnimationsForTest = false,
    this.padding,
  })  : imageUrl = '',
        widget = null;

  const CarouselItemWidget.widget({
    super.key,
    this.widget,
    this.onTap,
    this.disableAnimationsForTest = false,
    this.padding,
  })  : title = '',
        desc = '',
        prefixIcon = null,
        imageUrl = '',
        bgColor = null,
        textColor = null;

  final String imageUrl;
  final String title;
  final String desc;
  final Color? textColor;
  final Color? bgColor;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool disableAnimationsForTest;
  final EdgeInsets? padding;
  final Widget? widget;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.all(4),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (title.isNotEmpty && desc.isNotEmpty && prefixIcon is Widget)
              LedgerStatusCard.info(
                bgColor: bgColor,
                textColor: textColor,
                prefixIcon: prefixIcon,
                title: title,
                description: desc,
              ),
            if (imageUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (_, __, ___) => Shimmer.fromColors(
                  enabled: !disableAnimationsForTest,
                  baseColor: context.grey.shade400,
                  highlightColor: context.grey.shade400.withOpacity(0.05),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                placeholder: (_, __) => ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Shimmer.fromColors(
                    enabled: !disableAnimationsForTest,
                    baseColor: context.grey.shade400,
                    highlightColor: context.grey.shade400.withOpacity(0.05),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            CustomInkWell(
              context: context,
              trackLabel: 'Carousel Item',
              semanticsLabel: 'Carousel Item',
              borderRadius: BorderRadius.circular(24),
              onTap: onTap,
              splashColor: context.primary.shade500.withOpacity(0.22),
            ),
            if (widget != null) widget!,
          ],
        ),
      );
}
