// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 7),
          const Divider(),
          TextStyleExample(
            name: 'FigTree Display Large',
            style: kFigTreeTextTheme.displayLarge!,
          ),
          TextStyleExample(
            name: 'FigTree Display Medium',
            style: kFigTreeTextTheme.displayMedium!,
          ),
          TextStyleExample(
            name: 'FigTree Display Small',
            style: kFigTreeTextTheme.displaySmall!,
          ),
          TextStyleExample(
            name: 'FigTree Headline Large',
            style: kFigTreeTextTheme.headlineLarge!,
          ),
          TextStyleExample(
            name: 'FigTree Headline Medium',
            style: kFigTreeTextTheme.headlineMedium!,
          ),
          TextStyleExample(
            name: 'FigTree Headline Small',
            style: kFigTreeTextTheme.headlineSmall!,
          ),
          TextStyleExample(
            name: 'FigTree Title Large',
            style: kFigTreeTextTheme.titleLarge!,
          ),
          TextStyleExample(
            name: 'FigTree Title Medium',
            style: kFigTreeTextTheme.titleMedium!,
          ),
          TextStyleExample(
            name: 'FigTree Title Small',
            style: kFigTreeTextTheme.titleSmall!,
          ),
          TextStyleExample(
            name: 'FigTree Label Large',
            style: kFigTreeTextTheme.labelLarge!,
          ),
          TextStyleExample(
            name: 'FigTree Label Medium',
            style: kFigTreeTextTheme.labelMedium!,
          ),
          TextStyleExample(
            name: 'FigTree Label Small',
            style: kFigTreeTextTheme.labelSmall!,
          ),
          TextStyleExample(
            name: 'FigTree Body Large',
            style: kFigTreeTextTheme.bodyLarge!,
          ),
          TextStyleExample(
            name: 'FigTree Body Medium',
            style: kFigTreeTextTheme.bodyMedium!,
          ),
          TextStyleExample(
            name: 'FigTree Body Small',
            style: kFigTreeTextTheme.bodySmall!,
          ),
          const SizedBox(height: 7),
          const Divider(),
          TextStyleExample(
            name: 'Montserrat Display Large',
            style: kMontserratTextTheme.displayLarge!,
          ),
          TextStyleExample(
            name: 'Montserrat Display Medium',
            style: kMontserratTextTheme.displayMedium!,
          ),
          TextStyleExample(
            name: 'Montserrat Display Small',
            style: kMontserratTextTheme.displaySmall!,
          ),
          TextStyleExample(
            name: 'Montserrat Headline Large',
            style: kMontserratTextTheme.headlineLarge!,
          ),
          TextStyleExample(
            name: 'Montserrat Headline Medium',
            style: kMontserratTextTheme.headlineMedium!,
          ),
          TextStyleExample(
            name: 'Montserrat Headline Small',
            style: kMontserratTextTheme.headlineSmall!,
          ),
          TextStyleExample(
            name: 'Montserrat Title Large',
            style: kMontserratTextTheme.titleLarge!,
          ),
          TextStyleExample(
            name: 'Montserrat Title Medium',
            style: kMontserratTextTheme.titleMedium!,
          ),
          TextStyleExample(
            name: 'Montserrat Title Small',
            style: kMontserratTextTheme.titleSmall!,
          ),
          TextStyleExample(
            name: 'Montserrat Label Large',
            style: kMontserratTextTheme.labelLarge!,
          ),
          TextStyleExample(
            name: 'Montserrat Label Medium',
            style: kMontserratTextTheme.labelMedium!,
          ),
          TextStyleExample(
            name: 'Montserrat Label Small',
            style: kMontserratTextTheme.labelSmall!,
          ),
          TextStyleExample(
            name: 'Montserrat Body Large',
            style: kMontserratTextTheme.bodyLarge!,
          ),
          TextStyleExample(
            name: 'Montserrat Body Medium',
            style: kMontserratTextTheme.bodyMedium!,
          ),
          TextStyleExample(
            name: 'Montserrat Body Small',
            style: kMontserratTextTheme.bodySmall!,
          ),
          const SizedBox(height: 7),
          const Divider(),
          TextStyleExample(
            name: 'Inter Display Large',
            style: textTheme.displayLarge!,
          ),
          TextStyleExample(
            name: 'Inter Display Medium',
            style: textTheme.displayMedium!,
          ),
          TextStyleExample(
            name: 'Inter Display Small',
            style: textTheme.displaySmall!,
          ),
          TextStyleExample(
            name: 'Inter Headline Large',
            style: textTheme.headlineLarge!,
          ),
          TextStyleExample(
            name: 'Inter Headline Medium',
            style: textTheme.headlineMedium!,
          ),
          TextStyleExample(
            name: 'Inter Headline Small',
            style: textTheme.headlineSmall!,
          ),
          TextStyleExample(
            name: 'Inter Title Large',
            style: textTheme.titleLarge!,
          ),
          TextStyleExample(
            name: 'Inter Title Medium',
            style: textTheme.titleMedium!,
          ),
          TextStyleExample(
            name: 'Inter Title Small',
            style: textTheme.titleSmall!,
          ),
          TextStyleExample(
            name: 'Inter Label Large',
            style: textTheme.labelLarge!,
          ),
          TextStyleExample(
            name: 'Inter Label Medium',
            style: textTheme.labelMedium!,
          ),
          TextStyleExample(
            name: 'Inter Label Small',
            style: textTheme.labelSmall!,
          ),
          TextStyleExample(
            name: 'Inter Body Large',
            style: textTheme.bodyLarge!,
          ),
          TextStyleExample(
            name: 'Inter Body Medium',
            style: textTheme.bodyMedium!,
          ),
          TextStyleExample(
            name: 'Inter Body Small',
            style: textTheme.bodySmall!,
          ),
        ],
      ),
    );
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}
