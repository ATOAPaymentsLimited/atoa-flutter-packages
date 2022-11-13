import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_offer_carousel/src/offers_carousel_options.dart';
import 'package:custom_offer_carousel/src/offers_indicator_options.dart';

import 'package:flutter/material.dart';
import 'custom_offer_item_widget.dart';
import 'offer_placeholder.dart';
import 'page_indicators.dart';

/// [CustomOffersItemWidgetBuilder] defined for creating a itemBuilder that
/// builds [CustomOffersItemWidget] only.
typedef CustomOffersItemWidgetBuilder = CustomOffersItemWidget Function(
    BuildContext context, int index);

class CustomOffersSliderWidget extends StatefulWidget {
  ///[isFetching] can be useful when fetching list of offer's from api to show
  ///a loading shimmer, when this is set to true, [offersListCount] &
  ///[offersItemWidgetBuilder] should be null
  final bool isFetching;

  /// Length of list of your offer, used to build the offer carousel upto the
  /// maximum offer allowed to display in [maxOffersToDisplay]. It should always
  /// be passed as long as [isFetching] is false
  final int? offersListCount;

  /// [offersItemWidgetBuilder] is a custom widget builder, that helps you build
  /// [CustomOffersItemWidget] from your list of offer's with all neccesary
  /// parameters
  final CustomOffersItemWidgetBuilder? offersItemWidgetBuilder;

  /// [options] takes [OffersCarouselOptions] to help you change custom properties
  /// of the offer's carousel such as [aspectRatio], [viewportFraction] etc
  final OffersCarouselOptions options;

  /// [indicatorOptions] takes [OffersIndicatorOptions], to customize the
  /// offer's page indicators, such as colors, size
  final OffersIndicatorOptions indicatorOptions;

  /// [disableAnimationsForTest] is a helper parameter, if you want to disable
  /// animations while doing integration test's
  final bool disableAnimationsForTest;

  /// [maxOffersToDisplay] is used to define maximum no of offer's you want to
  /// display
  final int maxOffersToDisplay;

  /// [CustomOffersSliderWidget] creates a image carousel, which uses
  /// [offersItemWidgetBuilder] to creates it's child widget, main carousel
  /// can be customized with [options], while indicators can be customized
  /// using [indicatorOptions]
  ///
  /// [offersItemWidgetBuilder] and [offersListCount] can't be null
  const CustomOffersSliderWidget({
    Key? key,
    this.isFetching = false,
    this.offersListCount,
    this.offersItemWidgetBuilder,
    this.options = const OffersCarouselOptions(),
    this.indicatorOptions = const OffersIndicatorOptions(),
    this.maxOffersToDisplay = 5,
    this.disableAnimationsForTest = false,
  })  : assert(
            (isFetching &&
                    offersListCount == null &&
                    offersItemWidgetBuilder == null) ||
                (!isFetching &&
                    offersListCount != null &&
                    offersItemWidgetBuilder != null),
            '''If isFetching is true, then offersListCount and offersItemWidgetBuilder 
            should be null, otherwise offersListCount and offersItemWidgetBuilder 
            can't be null.'''),
        super(key: key);

  @override
  State<CustomOffersSliderWidget> createState() =>
      _CustomOffersSliderWidgetState();
}

class _CustomOffersSliderWidgetState extends State<CustomOffersSliderWidget>
    with WidgetsBindingObserver {
  late List<CustomOffersItemWidget> _offersItemList;

  late ValueNotifier<int> currentOfferIndexNotifier;

  /// [_autoScroll] is defined to handle the manual interaction
  late bool _autoScroll;

  @override
  void initState() {
    super.initState();
    currentOfferIndexNotifier = ValueNotifier<int>(0);
    _autoScroll = widget.options.autoScroll;
    if (!widget.isFetching) {
      _offersItemList = _getCustomOffersItemWidgetList();
    } else {
      _offersItemList = [];
    }
  }

  @override
  void didUpdateWidget(covariant CustomOffersSliderWidget oldWidget) {
    if (oldWidget.isFetching != widget.isFetching) {
      if (oldWidget.isFetching) {
        _offersItemList = _getCustomOffersItemWidgetList();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    currentOfferIndexNotifier.value = index;

    if (_autoScroll && reason == CarouselPageChangedReason.manual) {
      setState(() => _autoScroll = false);
    }
  }

  int get _maxofferToDisplay {
    if (widget.isFetching) {
      return 0;
    }

    return widget.offersListCount! > widget.maxOffersToDisplay
        ? widget.maxOffersToDisplay
        : widget.offersListCount!;
  }

  bool get _shouldAutoPlay {
    if (widget.isFetching) {
      return false;
    }

    return _autoScroll &&
        _offersItemList.length > 1 &&
        !widget.disableAnimationsForTest;
  }

  /// Get List of [CustomOffersSliderWidget] through [offersItemWidgetBuilder]
  List<CustomOffersItemWidget> _getCustomOffersItemWidgetList() {
    return List<CustomOffersItemWidget>.generate(widget.offersListCount!,
        (index) {
      return widget.offersItemWidgetBuilder!(context, index);
    }).take(_maxofferToDisplay).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Column(
        children: [
          CarouselSlider(
            items: widget.isFetching ||
                    (widget.offersListCount != null &&
                        widget.offersListCount == 0)
                ? [
                    OffersPlaceHolder(
                      aspectRatio: widget.options.aspectRatio,
                      disableAnimationsForTest: widget.disableAnimationsForTest,
                    )
                  ]
                : _offersItemList,
            options: CarouselOptions(
              autoPlay: _shouldAutoPlay,
              aspectRatio: widget.options.aspectRatio,
              viewportFraction: widget.options.viewportFraction,
              pauseAutoPlayOnTouch: true,
              pauseAutoPlayOnManualNavigate: true,
              autoPlayAnimationDuration: widget.options.animationDuration,
              onPageChanged: _onPageChanged,
              enableInfiniteScroll: _maxofferToDisplay > 1,
            ),
          ),
          if (_maxofferToDisplay > 1)
            PageIndicators(
              count: _maxofferToDisplay,
              currentOfferIndexNotifier: currentOfferIndexNotifier,
              options: widget.indicatorOptions,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    currentOfferIndexNotifier.dispose();
    super.dispose();
  }
}
