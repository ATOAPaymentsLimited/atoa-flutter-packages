import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class PageViewBottomSheetContent extends StatefulWidget {
  const PageViewBottomSheetContent({
    super.key,
    required this.title,
    required this.subTitle,
    required this.pageController,
    required this.children,
    this.titleStyle,
    this.titleAlign,
    this.showCloseButton = true,
    this.onClose,
    this.illustrationWidget,
    this.showDragHandle,
    this.showTitle = true,
    this.titleBottomSpacing,
    this.scrollDirection,
    this.physics,
  });

  final List<String> title;
  final List<String> subTitle;
  final List<Widget> children;
  final PageController pageController;
  final TextStyle? titleStyle;
  final TextAlign? titleAlign;
  final void Function(BuildContext)? onClose;
  final Widget? illustrationWidget;
  final bool showCloseButton;
  final bool? showDragHandle;
  final double? titleBottomSpacing;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final bool showTitle;

  @override
  State<PageViewBottomSheetContent> createState() =>
      _PageViewBottomSheetContentState();
}

class _PageViewBottomSheetContentState
    extends State<PageViewBottomSheetContent> {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showDragHandle ?? true)
            Container(
              height: Spacing.lds50.value,
              width: Spacing.lds300.value * 2 + Spacing.lds25.value,
              decoration: BoxDecoration(
                borderRadius: RadiusSpacing.rdsxs.all,
                color: context.grey.shade200,
              ),
            ),
          Spacing.lds300.yBox,
          if (widget.illustrationWidget != null)
            widget.illustrationWidget ?? const SizedBox.shrink(),
          if (widget.showTitle) ...[
            Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, value, child) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (value != 0)
                            Padding(
                              padding: Spacing.lds50.top,
                              child: CustomInkWell(
                                semanticsLabel: 'Back Button Sheet Icon',
                                context: context,
                                borderRadius: RadiusSpacing.rdsl.all,
                                splashColor: context.grey.shade200,
                                trackLabel: 'Back Button Sheet Icon',
                                onTap: () =>
                                    widget.pageController.animateToPage(
                                  value - 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ),
                                child: Container(
                                  width: Spacing.lds300.value +
                                      Spacing.lds50.value,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.grey.shade50,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: Spacing.lds50.all,
                                      child: SvgPicture.asset(
                                        'assets/icons/chevron_left.svg',
                                        height: Spacing.lds200.value,
                                        width: Spacing.lds200.value,
                                        colorFilter: ColorFilter.mode(
                                          context.grey.shade700,
                                          BlendMode.srcIn,
                                        ),
                                        package: 'ledger_design_system',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                                  (widget.subTitle[value].trim().isNotEmpty
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.start),
                              children: [
                                if (widget.title[value].trim().isNotEmpty)
                                  CustomText.semantics(
                                    widget.title[value],
                                    textAlign: widget.titleAlign ??
                                        (widget.subTitle[value]
                                                .trim()
                                                .isNotEmpty
                                            ? TextAlign.center
                                            : TextAlign.left),
                                    style: widget.titleStyle ??
                                        context.body1.bold.copyWith(
                                          color: context.baseBlack,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          Spacing.lds200.xBox,
                          if (widget.showCloseButton) child!,
                        ],
                      ),
                      if (widget.subTitle[value].trim().isNotEmpty) ...[
                        Spacing.lds50.yBox,
                        Align(
                          child: CustomText.semantics(
                            widget.subTitle[value],
                            textAlign: widget.titleAlign ?? TextAlign.left,
                            style: widget.titleStyle ??
                                context.caption.medium.copyWith(
                                  color: context.grey.shade500,
                                ),
                          ),
                        ),
                        Spacing.lds300.yBox,
                      ],
                    ],
                  ),
                  child: Padding(
                    padding: Spacing.lds50.top,
                    child: CustomInkWell(
                      semanticsLabel: 'Close Dialog Sheet Icon',
                      borderRadius: RadiusSpacing.rdsl.all,
                      splashColor: context.grey.shade200,
                      context: context,
                      trackLabel: 'Close Dialog Sheet Icon',
                      onTap: widget.onClose != null
                          ? () => widget.onClose?.call(context)
                          : () {
                              Navigator.pop(context);
                            },
                      child: Container(
                        width: Spacing.lds300.value + Spacing.lds50.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.grey.shade50,
                        ),
                        child: Center(
                          child: Padding(
                            padding: Spacing.lds50.all,
                            child: Icon(
                              Icons.close,
                              size: Spacing.lds200.value,
                              color: context.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (widget.titleBottomSpacing != null)
            SizedBox(
              height: widget.titleBottomSpacing,
            )
          else
            Spacing.lds300.yBox,
          Expanded(
            child: PageView(
              physics: widget.physics,
              controller: widget.pageController,
              onPageChanged: (value) => currentIndex.value = value,
              scrollDirection: widget.scrollDirection ?? Axis.horizontal,
              children: widget.children,
            ),
          ),
        ],
      );
}
