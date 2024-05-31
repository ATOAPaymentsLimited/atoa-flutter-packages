import 'package:flutter/material.dart';

import 'package:regal/regal.dart';

Future<T?> showRegalBottomSheet<T>({
  required BuildContext context,
  required String title,
  required WidgetBuilder body,
  void Function(BuildContext)? onClose,
  TextStyle? titleStyle,
  TextAlign? titleAlign,
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
  AnimationController? transitionAnimationController,
  Alignment confettiAlignment = Alignment.center,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (titleAlign == null)
                  Spacing.huge.xBox
                else
                  const SizedBox.shrink(),
                Expanded(
                  child: Padding(
                    padding: titleAlign == null
                        ? Spacing.small.x
                        : Spacing.small.right,
                    child: Text(
                      title,
                      textAlign: titleAlign ?? TextAlign.center,
                      style: titleStyle ??
                          dialogContext.labelLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                if (isDismissable)
                  CustomInkWell(
                    semanticsLabel: 'Close Dialog Sheet Icon',
                    context: dialogContext,
                    trackLabel: 'Close Dialog Sheet Icon',
                    onTap: onClose != null
                        ? () => onClose.call(dialogContext)
                        : () {
                            Navigator.pop(dialogContext);
                          },
                    child: Container(
                      width: Spacing.huge.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.33,
                          color: RegalColors.grey.shade40,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: Spacing.tiny.all,
                          child: Icon(
                            Icons.close,
                            size: Spacing.medium.value,
                            color: RegalColors.grey.shade40,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Spacing.huge.yBox,
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
