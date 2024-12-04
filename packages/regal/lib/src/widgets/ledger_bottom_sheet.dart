import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

Future<T?> showLedgerBottomSheet<T>({
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
  ShapeBorder? shape,
  AnimationController? transitionAnimationController,
  Alignment confettiAlignment = Alignment.center,
  bool showTitle = true,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Padding(
        padding: Spacing.large.y + Spacing.xtraLarge.x,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Spacing.mini.value,
              width: Spacing.huge.value * 2 + Spacing.tiny.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Spacing.mini.value),
                color: context.neutralColors.grey.shade200,
              ),
            ),
            Spacing.huge.yBox,
            if (showTitle) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText.semantics(
                      title,
                      textAlign: titleAlign ?? TextAlign.left,
                      style: titleStyle ??
                          dialogContext.labelMedium?.w700.height130
                              .textColor(context.baseColors.black),
                    ),
                  ),
                  Spacing.large.xBox,
                  if (showCloseButton)
                    Padding(
                      padding: Spacing.mini.top,
                      child: CustomInkWell(
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
                            color: RegalColors.grey.shade40,
                          ),
                          child: Center(
                            child: Padding(
                              padding: Spacing.mini.all,
                              child: Icon(
                                Icons.close,
                                size: Spacing.medium.value,
                                color: RegalColors.snowWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
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
      useSafeArea: true,
      transitionAnimationController: transitionAnimationController,
    );
