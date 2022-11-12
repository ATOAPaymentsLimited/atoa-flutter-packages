# Custom Offer Carousel

Offer's Image Carousel

## Getting Started

- Add dependecies

```yaml
dependencies:
  custom_offer_carousel:
    git:
      url: git@atoa.github.com:ATOAPaymentsLimited/atoa-flutter-packages.git
      ref: main
      path: packages/custom_offer_carousel
```

Need to include the import of the package to the dart file where it will be used, use the below command,

```dart
import 'package:custom_offer_carousel/custom_offer_carousel.dart';
```

## Basic Usage

```dart
CustomOffersSliderWidget(
    offersListCount: offerImgUrl.length,
    offersItemWidgetBuilder: (context, index) {
        return CustomOffersItemWidget(
                imageUrl: offerImgUrl[index],
                onTap: () {},
            );
        },
)
```

## Features

- Customizable Carousel and Indicator Options
- Shows Shimmer Effect

### ScreenShots

|                                  1                                  |
| :-----------------------------------------------------------------: |
| ![CustomOffersCarousel](example/showcase/custom_offer_carousel.png) |
