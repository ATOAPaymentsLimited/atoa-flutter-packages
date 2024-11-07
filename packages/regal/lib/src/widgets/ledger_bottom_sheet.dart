import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

Future<T?> showLedgerBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder body,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool useRootNavigator = false,
  bool isScrollControlled = true,
  RouteSettings? routeSettings,
  Color? backgroundColor,
  Clip? clipBehavior,
  double? elevation,
  bool enableDrag = true,
  bool isDismissable = true,
  ShapeBorder? shape,
  OperatorSizedBox? topPadding,
  AnimationController? transitionAnimationController,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Padding(
        padding:
            Spacing.xtraLarge.x + Spacing.large.top + Spacing.xtraLarge.bottom,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Spacing.mini.value,
              width: Spacing.huge.value * 2,
              decoration: BoxDecoration(
                color: context.grey.shade10,
                borderRadius: BorderRadius.circular(Spacing.xtraLarge.value),
              ),
            ),
            topPadding ?? Spacing.huge.yBox,
            Builder(
              builder: body,
            ),
          ],
        ),
      ),
      isScrollControlled: isScrollControlled,
      barrierColor: barrierColor,
      constraints: constraints,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      backgroundColor: backgroundColor,
      clipBehavior: clipBehavior,
      elevation: elevation,
      enableDrag: enableDrag,
      isDismissible: isDismissable,
      shape: shape,
      transitionAnimationController: transitionAnimationController,
    );
