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
typedef ItemWidgetBuilder = Widget Function(
  BuildContext context,
  int index,
);

class CarouselWidgetSlider extends StatefulWidget {
  /// [CarouselWidgetSlider] creates a image carousel, which uses
  /// [itemsWidgetBuilder] to creates it's child widget, main carousel
  /// can be customized with [options], while indicators can be customized
  /// using [indicatorOptions]
  ///
  /// [itemsWidgetBuilder] and [itemsListCount] can't be null
  const CarouselWidgetSlider({
    super.key,
    this.isFetching = false,
    this.itemsListCount,
    this.itemsWidgetBuilder,
    this.indicatorOptions = const IndicatorOptions(),
    required this.options,
    this.maxItemsToDisplay = 5,
    this.disableAnimationsForTest = false,
  }) : assert(
            (isFetching &&
                    itemsListCount == null &&
                    itemsWidgetBuilder == null) ||
                (!isFetching &&
                    itemsListCount != null &&
                    itemsWidgetBuilder != null),
            '''
If isFetching is true, then itemsListCount and itemsWidgetBuilder 
            should be null, otherwise itemsListCount and itemsWidgetBuilder 
            can't be null.''');

  ///[isFetching] can be useful when fetching list of widget's from api to show
  ///a loading shimmer, when this is set to true, [itemsListCount] &
  ///[itemsWidgetBuilder] should be null
  final bool isFetching;

  /// Length of list of your widgets, used to build the widget carousel upto the
  /// maximum widget allowed to display in [maxItemsToDisplay]. It should always
  /// be passed as long as [isFetching] is false
  final int? itemsListCount;

  /// [itemsWidgetBuilder] is a custom widget builder, that helps you build
  /// [CarouselItemWidget] from your list of widget's with all neccesary
  /// parameters
  final ItemWidgetBuilder? itemsWidgetBuilder;

  /// [options] takes [CarouselOptions] to help you change custom properties
  /// of the widget's carousel such as [aspectRatio], [viewportFraction] etc
  final CarouselOptions options;

  /// [indicatorOptions] takes [IndicatorOptions], to customize the
  /// widget's page indicators, such as colors, size
  final IndicatorOptions indicatorOptions;

  /// [disableAnimationsForTest] is a helper parameter, if you want to disable
  /// animations while doing integration test's
  final bool disableAnimationsForTest;

  /// [maxItemsToDisplay] is used to define maximum no of widget's you want to
  /// display
  final int maxItemsToDisplay;

  @override
  State<CarouselWidgetSlider> createState() => _CarouselWidgetSliderState();
}

class _CarouselWidgetSliderState extends State<CarouselWidgetSlider>
    with WidgetsBindingObserver {
  late List<Widget> _itemsList;

  late ValueNotifier<int> currentItemIndexNotifier;

  /// [_autoScroll] is defined to handle the manual interaction
  late bool _autoScroll;

  @override
  void initState() {
    super.initState();
    currentItemIndexNotifier = ValueNotifier<int>(0);
    _autoScroll = widget.options.autoPlay;
    if (!widget.isFetching) {
      _itemsList = _getCarouselItemWidgetList();
    } else {
      _itemsList = [];
    }
  }

  @override
  void didUpdateWidget(covariant CarouselWidgetSlider oldWidget) {
    if (oldWidget.isFetching != widget.isFetching) {
      if (oldWidget.isFetching) {
        _itemsList = _getCarouselItemWidgetList();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    currentItemIndexNotifier.value = index;

    if (_autoScroll && reason == CarouselPageChangedReason.manual) {
      setState(() => _autoScroll = false);
    }
  }

  int get _maxItemsToDisplay {
    if (widget.isFetching) {
      return 0;
    }

    return widget.itemsListCount! > widget.maxItemsToDisplay
        ? widget.maxItemsToDisplay
        : widget.itemsListCount!;
  }

  bool get _shouldAutoPlay {
    if (widget.isFetching) {
      return false;
    }

    return _autoScroll &&
        _itemsList.length > 1 &&
        !widget.disableAnimationsForTest;
  }

  /// Get List of [CarouselWidgetSlider] through [itemsWidgetBuilder]
  List<Widget> _getCarouselItemWidgetList() => List<Widget>.generate(
        widget.itemsListCount!,
        (index) => widget.itemsWidgetBuilder!(context, index),
      ).take(_maxItemsToDisplay).toList();

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: Column(
          children: [
            slider.CarouselSlider(
              items: widget.isFetching ||
                      (widget.itemsListCount != null &&
                          widget.itemsListCount == 0)
                  ? []
                  : _itemsList,
              options: widget.options.copyWith(
                autoPlay: _shouldAutoPlay,
                onPageChanged: _onPageChanged,
              ),
            ),
            if (_maxItemsToDisplay > 1)
              PageIndicators(
                count: _maxItemsToDisplay,
                currentOfferIndexNotifier: currentItemIndexNotifier,
                options: widget.indicatorOptions,
              ),
          ],
        ),
      );

  @override
  void dispose() {
    currentItemIndexNotifier.dispose();
    super.dispose();
  }
}
