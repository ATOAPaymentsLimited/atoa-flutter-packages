import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';
import 'focus_lines_shape_animation.dart';

class CustomNavigationCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? chipTitle;
  final Widget? icon;
  final bool highlightCard;
  final bool showFocusLines;
  final String? svgAsset;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? iconColor;
  final bool _showTileView;

  const CustomNavigationCard({
    Key? key,
    required this.title,
    this.svgAsset,
    required this.onPressed,
    this.icon,
    this.chipTitle,
    this.highlightCard = false,
    this.showFocusLines = false,
    this.bgColor = Colors.white,
    this.iconColor,
  })  : assert(!(icon == null && svgAsset == null)),
        assert(!(icon != null && svgAsset != null)),
        _showTileView = false,
        subTitle = '',
        super(key: key);

  const CustomNavigationCard.tile({
    Key? key,
    required this.title,
    required this.subTitle,
    this.svgAsset,
    required this.onPressed,
    this.bgColor = Colors.white,
    this.iconColor,
  })  : _showTileView = true,
        highlightCard = false,
        showFocusLines = false,
        chipTitle = null,
        icon = null,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    if (_showTileView) {
      return Material(
        color: bgColor,
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.2),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48.sp,
                  width: 48.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: CustomColors.lightestGrey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: icon ??
                        SvgPicture.asset(
                          svgAsset!,
                          color: iconColor ?? CustomColors.navyBlue1,
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4.0),
                      AutoSizeText(
                        subTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: CustomColors.lightGrey40,
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
                color: CustomColors.lightBeige4,
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
            color: bgColor,
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
                              color: CustomColors.beige,
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
                              height: 26.sp,
                              child: Padding(
                                padding: EdgeInsets.all(2.sp),
                                child: SvgPicture.asset(
                                  svgAsset!,
                                  color: iconColor ?? CustomColors.navyBlue1,
                                ),
                              ),
                            ),
                        SizedBox(height: 8.sp),
                        AutoSizeText(
                          title,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    height: 1.18,
                                  ),
                        )
                      ],
                    ),
                  ),
                  if (showFocusLines)
                    const CustomFocusLinesShapeAnimation(
                      height: double.infinity,
                      width: double.infinity,
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
                color: CustomColors.lightBeige3,
                border: Border.all(
                  width: 1.sp,
                  color: CustomColors.beige,
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
