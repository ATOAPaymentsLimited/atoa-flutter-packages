import 'package:flutter/material.dart';
import 'package:regal/ledger/ledger_theme/ledger_theme.dart';
import 'package:regal/ledger/ledger_theme/widgets/page_view_bottom_sheet_content.dart';
import 'package:regal/ledger/spacing/spacing.dart';

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
  Widget? illustrationWidget,
  bool showTitle = true,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Theme(
        data: dialogContext.theme,
        child: Padding(
          padding: Spacing.lds200.y + Spacing.lds250.x,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Spacing.lds50.value,
                width: Spacing.lds300.value * 2 + Spacing.lds25.value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Spacing.lds50.value),
                  color: dialogContext.grey.shade200,
                ),
              ),
              Spacing.lds300.yBox,
              if (illustrationWidget != null) illustrationWidget,
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
                            dialogContext.title3.bold
                                .copyWith(color: dialogContext.baseBlack),
                      ),
                    ),
                    Spacing.lds200.xBox,
                    if (showCloseButton)
                      Padding(
                        padding: Spacing.lds50.top,
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
                            width: Spacing.lds300.value + Spacing.lds50.value,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: dialogContext.grey.shade50,
                            ),
                            child: Center(
                              child: Padding(
                                padding: Spacing.lds50.all,
                                child: Icon(
                                  Icons.close,
                                  size: Spacing.lds200.value,
                                  color: dialogContext.grey.shade700,
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
                SizedBox(height: titleBottomSpacing)
              else
                Spacing.lds300.yBox,
              Builder(
                builder: body,
              ),
            ],
          ),
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

Future<T?> showLedgerBottomSheetDraggable<T>({
  required BuildContext context,
  required String title,
  required WidgetBuilder body,
  void Function(BuildContext)? onClose,
  TextStyle? titleStyle,
  TextAlign? titleAlign,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool useRootNavigator = false,
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
  double initialChildSize = 0.7,
  double minChildSize = 0.7,
  double maxChildSize = 1.0,
  List<double> snapSizes = const [0.7, 1.0],
  Widget? illustrationWidget,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Theme(
        data: dialogContext.theme,
        child: DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          snap: true,
          snapSizes: snapSizes,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: dialogContext.baseWhite,
              borderRadius: RadiusSpacing.rds2xl.topCorners,
            ),
            padding: Spacing.lds200.y + Spacing.lds250.x,
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: Spacing.lds50.value,
                    width: Spacing.lds300.value * 2 + Spacing.lds25.value,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Spacing.lds50.value),
                      color: dialogContext.grey.shade200,
                    ),
                  ),
                  Spacing.lds300.yBox,
                  if (illustrationWidget != null) illustrationWidget,
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
                                dialogContext.title3.bold
                                    .copyWith(color: dialogContext.baseBlack),
                          ),
                        ),
                        Spacing.lds200.xBox,
                        if (showCloseButton)
                          Padding(
                            padding: Spacing.lds50.top,
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
                                width:
                                    Spacing.lds300.value + Spacing.lds50.value,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dialogContext.grey.shade50,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: Spacing.lds50.all,
                                    child: Icon(
                                      Icons.close,
                                      size: Spacing.lds200.value,
                                      color: dialogContext.grey.shade700,
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
                    SizedBox(height: titleBottomSpacing)
                  else
                    Spacing.lds300.yBox,
                  Builder(
                    builder: body,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      barrierColor: barrierColor,
      constraints: constraints,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      backgroundColor: backgroundColor ?? Colors.transparent,
      clipBehavior: clipBehavior,
      elevation: elevation ?? 0,
      enableDrag: enableDrag,
      isDismissible: isDismissable,
      shape: shape,
      useSafeArea: true,
      transitionAnimationController: transitionAnimationController,
    );

Future<T?> showLedgerBottomSheetStacked<T>({
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
                    padding: Spacing.lds250.all,
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
                        size: Spacing.lds300.value,
                        color: dialogContext.baseWhite,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: bodyPadding ?? Spacing.lds250.all,
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

Future<T?> showLedgerBottomSheetPageView<T>({
  required BuildContext context,
  required List<String> title,
  required List<String> subTitle,
  required PageController pageController,
  ScrollPhysics? physics,
  void Function(BuildContext)? onClose,
  TextStyle? titleStyle,
  TextAlign? titleAlign,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool useRootNavigator = false,
  bool isScrollControlled = true,
  RouteSettings? routeSettings,
  Color? backgroundColor,
  required List<Widget> children,
  Clip? clipBehavior,
  double? elevation,
  bool? showDragHandle,
  double? titleBottomSpacing,
  bool enableDrag = true,
  bool isDismissable = true,
  bool showCloseButton = true,
  ShapeBorder? shape,
  AnimationController? transitionAnimationController,
  Alignment confettiAlignment = Alignment.center,
  Widget? illustrationWidget,
  bool showTitle = true,
  Axis? scrollDirection,
}) =>
    showModalBottomSheet<T>(
      context: context,
      builder: (dialogContext) => Theme(
        data: context.theme,
        child: Padding(
          padding:
              Spacing.lds250.x + Spacing.lds300.bottom + Spacing.lds150.bottom,
          child: PageViewBottomSheetContent(
            title: title,
            subTitle: subTitle,
            pageController: pageController,
            titleStyle: titleStyle,
            titleAlign: titleAlign,
            showCloseButton: showCloseButton,
            onClose: onClose,
            titleBottomSpacing: titleBottomSpacing,
            illustrationWidget: illustrationWidget,
            physics: physics,
            scrollDirection: scrollDirection,
            children: children,
          ),
        ),
      ),
      showDragHandle: showDragHandle,
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
