import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class SupportedBankSlider extends StatefulWidget {
  ///[SupportedBankSlider] creates a animated logo slider that slides
  ///automatically.
  ///
  ///Required argument is [bankIconUrlList]
  const SupportedBankSlider({
    super.key,
    required this.bankIconUrlList,
    this.animationDuration = const Duration(seconds: 1),
    this.primaryBackgroundColor = Colors.white,
    this.sliderBackgroundColor = Colors.white,
    this.contentPadding,
    this.disableAnimationsForTest = false,
    this.title,
  });

  /// [bankIconUrlList] takes list of bank logo url's
  final List<String> bankIconUrlList;

  /// Animation Duration while sliding from one logo to another
  ///
  /// Defaults to 1 second
  final Duration animationDuration;

  /// Specifies the main frame background color.
  ///
  /// Defaults to white color
  final Color primaryBackgroundColor;

  /// Specifies the logo slider background color.
  ///
  /// Defaults to white color.
  final Color sliderBackgroundColor;

  /// Used to specify the vertical padding between main container and content
  ///
  /// Default to 12.sp vertically
  final EdgeInsets? contentPadding;

  /// Helper parameter, if you want to disable animation while doing integration
  /// tests
  final bool disableAnimationsForTest;

  final String? title;

  @override
  State<SupportedBankSlider> createState() => _SupportedBankSliderState();
}

class _SupportedBankSliderState extends State<SupportedBankSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<String> _bankIconUrlList = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final first = _bankIconUrlList.first;
          _bankIconUrlList
            ..removeAt(0)
            ..add(first);
          _animationController.forward(from: 0);
        }
      });

    if (widget.bankIconUrlList.isNotEmpty) {
      _bankIconUrlList = [...widget.bankIconUrlList];
      if (_bankIconUrlList.isNotEmpty) {
        _startLooping();
      }
    }
  }

  void _startLooping() {
    if (mounted && !widget.disableAnimationsForTest) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant SupportedBankSlider oldWidget) {
    if (oldWidget.bankIconUrlList != widget.bankIconUrlList) {
      _bankIconUrlList = [...widget.bankIconUrlList];
      if (oldWidget.bankIconUrlList.isEmpty &&
          widget.bankIconUrlList.isNotEmpty) {
        _startLooping();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    final hasTitle = title != null && title.isNotEmpty;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: widget.bankIconUrlList.isEmpty
          ? SizedBox(
              height: hasTitle ? 95.sp : 84.sp,
              width: double.infinity,
            )
          : Container(
              height: hasTitle ? 95.sp : 84.sp,
              width: double.infinity,
              color: widget.primaryBackgroundColor,
              child: Padding(
                padding: widget.contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: 12.sp,
                    ),
                child: Column(
                  children: [
                    if (hasTitle)
                      Text(
                        title,
                        style: context.body3,
                      ),
                    Container(
                      color: widget.sliderBackgroundColor,
                      width: double.infinity,
                      height: 56.h,
                      child: Stack(
                        children: [
                          ..._bankIconUrlList.map(
                            (bankIconurl) {
                              final index = _bankIconUrlList.indexWhere(
                                (element) => element == bankIconurl,
                              );

                              return Positioned.fromRect(
                                rect: _getBankLogoRect(index, 56.h),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.sp),
                                    child: CachedNetworkImage(
                                      imageUrl: bankIconurl,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
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

  Rect _getBankLogoRect(int index, double size) => Rect.fromLTWH(
        index * size - (_animationController.value * size),
        0,
        size,
        size,
      );
}
