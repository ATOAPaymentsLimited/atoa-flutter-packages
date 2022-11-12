import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';
import 'focus_lines_shape_animation.dart';

class CustomNavigationCard extends StatelessWidget {
  /// Main title of card
  final String title;

  // Can be used to make Title Bold
  final FontWeight titleFontWeight;

  /// Description text for the card
  final String subTitle;

  /// [borderColor] is used to specify border color of card when highlighted,
  /// for this [highlightCard] should be true.
  final Color? borderColor;

  /// [backgroundColor] is used to specify background color of card
  final Color? backgroundColor;

  /// [foregroundColor] is used to specify the color of text and svg
  final Color? foregroundColor;

  /// [subTitleTextColor] is used to specify description text color
  final Color? subTitleTextColor;

  /// [splashColor] creates an ink well
  final Color? splashColor;

  /// use [icon] as an alternative to include your own custom widget,
  /// instead of svg
  final Widget? icon;

  /// use [svgAsset] to directly include svg icons, [icon] should be null in
  /// this case
  final String? svgAsset;

  /// [onPressed] can be used to pass callback to whole card.
  final VoidCallback onPressed;

  /// [chipTitle] can be used to have text on custom chip placed on top right
  /// corner. it will only show chip, when [chipTitle] is not null.
  final String? chipTitle;

  /// [chipTextColor] can be used to change custom chip text color, only applies
  /// when [chipTitle] is not null
  final Color? chipTextColor;

  /// [chipBackgroundColor] can be used to change custom chip background color,
  /// only applies when [chipTitle] is not null
  final Color? chipBackgroundColor;

  /// [chipBorderColor] can be used to change custom chip border color,
  /// only applies when [chipTitle] is not null
  final Color? chipBorderColor;

  /// [highlightCard] can be used to highlight card with a glow and border, and
  /// colors can be changed when used with combination of [borderColor]
  final bool highlightCard;

  /// [showFocusLines] can be used to enable a custom focus lines animation
  /// inside the card
  final bool showFocusLines;

  /// [focusLinesDuration] can be used with [showFocusLines] to change it's
  /// animation duration
  final Duration? focusLinesDuration;

  /// [focusLinesgradientColor] can be used with [showFocusLines] to change it's
  /// the shapes gradient color
  final Color? focusLinesgradientColor;

  final bool _showTileView;

  /// [CustomNavigationCard] can be used to create a custom card designs that
  /// is built for grids. [title] & [onPressed] can't be null, Either [icon] or
  /// [svgAsset] can be used to have a icon, one is required and both can't be
  /// used at once. It supports Custom Chip, that can be enabled with
  /// [chipTitle]. Card can be highlighted with a border and
  /// glow using [highlightCard], with option to change colors. Also has a focus
  /// lines shape animation that can be enabled with [showFocusLines]
  const CustomNavigationCard({
    Key? key,
    required this.title,
    this.svgAsset,
    required this.onPressed,
    this.icon,
    this.chipTitle,
    this.highlightCard = false,
    this.showFocusLines = false,
    this.titleFontWeight = FontWeight.w400,
    this.borderColor = CustomColors.lightBeige4,
    this.backgroundColor = Colors.white,
    this.foregroundColor = CustomColors.navyBlue1,
    this.splashColor,
    this.chipBackgroundColor,
    this.chipBorderColor,
    this.chipTextColor,
    this.focusLinesDuration = const Duration(milliseconds: 24000),
    this.focusLinesgradientColor = CustomColors.beige,
  })  : assert(
            !(chipTitle == null &&
                (chipBackgroundColor != null ||
                    chipBorderColor != null ||
                    chipTextColor != null)),
            "Custom Chip Properties can't be set unless you specify chipTitle"),
        assert(!(icon == null && svgAsset == null),
            "Either icon or svgAsset is Required"),
        assert(!(icon != null && svgAsset != null),
            "You can only have icon or svgAsset"),
        _showTileView = false,
        subTitle = '',
        subTitleTextColor = null,
        super(key: key);

  /// [CustomNavigationCard.tile] can be used to create a custom card tile
  ///  designs that can be used in a listView, or an Column, It takes [title],
  /// [subTitle], along with either [icon] or [svgAsset]. [onPressed] can be
  /// used to provide callback.
  ///
  /// [foregroundColor], [backgroundColor] & [subTitleTextColor] can be used to
  /// change design colors.
  const CustomNavigationCard.tile({
    Key? key,
    required this.title,
    required this.subTitle,
    this.icon,
    this.svgAsset,
    this.subTitleTextColor,
    required this.onPressed,
    this.titleFontWeight = FontWeight.w600,
    this.backgroundColor = Colors.white,
    this.foregroundColor = CustomColors.navyBlue1,
    this.splashColor,
  })  : assert(!(icon == null && svgAsset == null),
            "Either icon or svgAsset is Required"),
        assert(!(icon != null && svgAsset != null),
            "You can only have icon or svgAsset"),
        _showTileView = true,
        highlightCard = false,
        showFocusLines = false,
        chipTitle = null,
        chipBackgroundColor = null,
        chipBorderColor = null,
        chipTextColor = null,
        focusLinesDuration = null,
        focusLinesgradientColor = null,
        borderColor = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_showTileView) {
      return Material(
        color: backgroundColor,
        child: InkWell(
          splashColor: splashColor ?? Colors.grey.withOpacity(0.2),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon ??
                    Container(
                      height: 48.sp,
                      width: 48.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: CustomColors.lightestGrey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: SvgPicture.asset(
                          svgAsset!,
                          color: foregroundColor ?? CustomColors.navyBlue1,
                        ),
                      ),
                    ),
                SizedBox(width: 24.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: foregroundColor,
                              fontWeight: titleFontWeight,
                            ),
                      ),
                      const SizedBox(height: 4.0),
                      AutoSizeText(
                        subTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w400,
                              color:
                                  subTitleTextColor ?? CustomColors.lightGrey40,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            if (highlightCard)
              BoxShadow(
                color: borderColor!,
                blurRadius: 20.r,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              )
            else
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20.r,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
          ]),
          child: Material(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.r),
              splashColor: Colors.grey.withOpacity(0.4),
              onTap: onPressed,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: highlightCard
                          ? Border.all(
                              color: borderColor!,
                              width: 1,
                            )
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon ??
                            SizedBox(
                              height: 32.sp,
                              child: SvgPicture.asset(
                                svgAsset!,
                                color:
                                    foregroundColor ?? CustomColors.navyBlue1,
                              ),
                            ),
                        SizedBox(height: 8.sp),
                        AutoSizeText(
                          title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    height: 1.18,
                                    fontWeight: titleFontWeight,
                                    color: foregroundColor,
                                  ),
                        )
                      ],
                    ),
                  ),
                  if (showFocusLines)
                    CustomFocusLinesShapeAnimation(
                      height: double.infinity,
                      width: double.infinity,
                      animationDuration: focusLinesDuration!,
                      gradientColor: focusLinesgradientColor!,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (chipTitle != null && chipTitle!.isNotEmpty)
          Positioned(
            top: -8.sp,
            right: -6.sp,
            child: Container(
              decoration: BoxDecoration(
                color: chipBackgroundColor ?? CustomColors.lightBeige3,
                border: Border.all(
                  width: 1.sp,
                  color: chipBorderColor ?? CustomColors.beige,
                ),
                borderRadius: BorderRadius.circular(
                  24.r,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 2.sp,
                ),
                child: Text(
                  chipTitle!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: chipTextColor,
                        height: 1.18,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
