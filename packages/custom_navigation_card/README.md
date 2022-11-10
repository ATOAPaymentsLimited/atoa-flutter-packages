# Custom Navigation Card

Card Design Especially built for Home Grid, and Menu Tile

## Getting Started

- Add dependecies

```yaml
dependencies:
  custom_navigation_card:
    url: git@atoa.github.com:ATOAPaymentsLimited/atoa-flutter-packages.git
    ref: master
    path: packages/custom_navigation_card
```

Need to include the import the package to the dart file where it will be used, use the below command,

```dart
import 'package:custom_navigation_card/custom_navigation_card.dart';
```

## Basic Usage

```dart
CustomNavigationCard(
    title: "Transactions",
    icon: const Icon(Icons.poll_rounded),
    onPressed: () {},
),
```

## Features

- Highlight Card
- Focus Lines Animation
- Colors & Styles Customizable

### ScreenShots

|                                  1                                   |
| :------------------------------------------------------------------: |
| ![CustomNavigationcard](example/showcase/custom_navigation_card.png) |
