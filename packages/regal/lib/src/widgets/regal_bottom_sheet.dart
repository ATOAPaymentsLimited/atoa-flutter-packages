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
  double? titleBottomSpacing,
  bool enableDrag = true,
  bool isDismissable = true,
  bool showCloseButton = true,
  Widget? illustrationWidget,
  ShapeBorder? shape,
  AnimationController? transitionAnimationController,
  Alignment confettiAlignment = Alignment.center,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Padding(
        padding: Spacing.xtraLarge.all,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (illustrationWidget != null) illustrationWidget,
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
                if (showCloseButton)
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
            if (titleBottomSpacing != null)
              OperatorSizedBox.height(
                titleBottomSpacing,
              )
            else
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

Future<T?> showRegalBottomSheetStacked<T>({
  required BuildContext context,
  required WidgetBuilder body,
  required Widget illustrationWidget,
  void Function(BuildContext)? onClose,
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
  bool showCloseButton = true,
  ShapeBorder? shape,
  EdgeInsets? bodyPadding,
  AnimationController? transitionAnimationController,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              illustrationWidget,
              if (showCloseButton)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: Spacing.xtraLarge.all,
                    child: CustomInkWell(
                      semanticsLabel: 'Close Dialog Sheet Icon',
                      context: dialogContext,
                      trackLabel: 'Close Dialog Sheet Icon',
                      onTap: onClose != null
                          ? () => onClose.call(dialogContext)
                          : () {
                              Navigator.pop(dialogContext);
                            },
                      child: Icon(
                        Icons.close,
                        size: Spacing.huge.value,
                        color: RegalColors.snowWhite,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: bodyPadding ?? Spacing.xtraLarge.all,
            child: Builder(
              builder: body,
            ),
          ),
        ],
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
