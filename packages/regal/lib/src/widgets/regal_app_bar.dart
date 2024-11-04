import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';
import 'package:regal/src/theme/regal_colors.dart';
import 'package:regal/src/utils/spacing.dart';
import 'package:regal/src/widgets/regal_linear_progress_indicator.dart';
import 'package:shimmer/shimmer.dart';

class RegalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegalAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.progress,
    this.loading = false,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool loading;
  final double? progress;

  @override
  Size get preferredSize => Size.fromHeight(60.sp);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            if (progress != null) ...[
              Builder(
                builder: (context) {
                  final progress = RegalLinearProgressIndicator(
                    width: double.infinity,
                    value: this.progress!,
                    height: Spacing.mini.value,
                    borderRadius: BorderRadius.zero,
                    linearGradient: const LinearGradient(
                      colors: [
                        RegalColors.darkOrange,
                        RegalColors.vividRed,
                      ],
                    ),
                    backgroundColor: context.grey.shade05,
                    borderColor: Colors.transparent,
                  );

                  if (loading == true) {
                    return Shimmer.fromColors(
                      baseColor: RegalColors.vividRed,
                      highlightColor: RegalColors.grey.shade40,
                      child: progress,
                    );
                  }

                  return progress;
                },
              ),
            ],
            AppBar(
              leading: leading,
              title: title,
              actions: actions,
            ),
          ],
        ),
      );
}
