// ignore_for_file: comment_references

import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

export 'package:carousel_slider/carousel_options.dart';

export 'carousel_item_widget.dart';
export 'indicator_options.dart';
export 'page_indicators.dart';
export 'place_holder_carousel.dart';

/// [CarouselItemWidgetBuilder] defined for creating a itemBuilder that
/// builds [CarouselItemWidget] only.
typedef CarouselItemWidgetBuilder = CarouselItemWidget Function(
  BuildContext context,
  int index,
);

class CarouselSlider extends StatefulWidget {
  /// [CarouselSlider] creates a image carousel, which uses
  /// [offersItemWidgetBuilder] to creates it's child widget, main carousel
  /// can be customized with [options], while indicators can be customized
  /// using [indicatorOptions]
  ///
  /// [offersItemWidgetBuilder] and [offersListCount] can't be null
  const CarouselSlider({
    super.key,
    this.isFetching = false,
    this.offersListCount,
    this.offersItemWidgetBuilder,
    this.indicatorOptions = const IndicatorOptions(),
    required this.options,
    this.maxOffersToDisplay = 5,
    this.disableAnimationsForTest = false,
  }) : assert(
            (isFetching &&
                    offersListCount == null &&
                    offersItemWidgetBuilder == null) ||
                (!isFetching &&
                    offersListCount != null &&
                    offersItemWidgetBuilder != null),
            '''
If isFetching is true, then offersListCount and offersItemWidgetBuilder 
            should be null, otherwise offersListCount and offersItemWidgetBuilder 
            can't be null.''');

  ///[isFetching] can be useful when fetching list of offer's from api to show
  ///a loading shimmer, when this is set to true, [offersListCount] &
  ///[offersItemWidgetBuilder] should be null
  final bool isFetching;

  /// Length of list of your offer, used to build the offer carousel upto the
  /// maximum offer allowed to display in [maxOffersToDisplay]. It should always
  /// be passed as long as [isFetching] is false
  final int? offersListCount;

  /// [offersItemWidgetBuilder] is a custom widget builder, that helps you build
  /// [CarouselItemWidget] from your list of offer's with all neccesary
  /// parameters
  final CarouselItemWidgetBuilder? offersItemWidgetBuilder;

  /// [options] takes [CarouselOptions] to help you change custom properties
  /// of the offer's carousel such as [aspectRatio], [viewportFraction] etc
  final CarouselOptions options;

  /// [indicatorOptions] takes [IndicatorOptions], to customize the
  /// offer's page indicators, such as colors, size
  final IndicatorOptions indicatorOptions;

  /// [disableAnimationsForTest] is a helper parameter, if you want to disable
  /// animations while doing integration test's
  final bool disableAnimationsForTest;

  /// [maxOffersToDisplay] is used to define maximum no of offer's you want to
  /// display
  final int maxOffersToDisplay;

  @override
  State<CarouselSlider> createState() => _CustomOffersSliderWidgetState();
}

class _CustomOffersSliderWidgetState extends State<CarouselSlider>
    with WidgetsBindingObserver {
  late List<CarouselItemWidget> _offersItemList;

  late ValueNotifier<int> currentOfferIndexNotifier;

  /// [_autoScroll] is defined to handle the manual interaction
  late bool _autoScroll;

  @override
  void initState() {
    super.initState();
    currentOfferIndexNotifier = ValueNotifier<int>(0);
    _autoScroll = widget.options.autoPlay;
    if (!widget.isFetching) {
      _offersItemList = _getCarouselItemWidgetList();
    } else {
      _offersItemList = [];
    }
  }

  @override
  void didUpdateWidget(covariant CarouselSlider oldWidget) {
    if (oldWidget.isFetching != widget.isFetching) {
      if (oldWidget.isFetching) {
        _offersItemList = _getCarouselItemWidgetList();
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

  /// Get List of [CarouselSlider] through [offersItemWidgetBuilder]
  List<CarouselItemWidget> _getCarouselItemWidgetList() {
    return List<CarouselItemWidget>.generate(widget.offersListCount!, (index) {
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
          slider.CarouselSlider(
            items: widget.isFetching ||
                    (widget.offersListCount != null &&
                        widget.offersListCount == 0)
                ? [
                    PlaceHolderCarousel(
                      aspectRatio: widget.options.aspectRatio,
                      disableAnimationsForTest: widget.disableAnimationsForTest,
                    )
                  ]
                : _offersItemList,
            options: widget.options.copyWith(
              autoPlay: _shouldAutoPlay,
              onPageChanged: _onPageChanged,
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
