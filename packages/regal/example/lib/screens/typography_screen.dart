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
          TextStyleExample(
              name: 'Montserrat Display Large',
              style: kMontserratTextTheme.displayLarge!),
          TextStyleExample(
              name: 'Montserrat Display Medium',
              style: kMontserratTextTheme.displayMedium!),
          TextStyleExample(
              name: 'Montserrat Display Small',
              style: kMontserratTextTheme.displaySmall!),
          TextStyleExample(
              name: 'Montserrat Headline Large',
              style: kMontserratTextTheme.headlineLarge!),
          TextStyleExample(
              name: 'Montserrat Headline Medium',
              style: kMontserratTextTheme.headlineMedium!),
          TextStyleExample(
              name: 'Montserrat Headline Small',
              style: kMontserratTextTheme.headlineSmall!),
          TextStyleExample(
              name: 'Montserrat Title Large',
              style: kMontserratTextTheme.titleLarge!),
          TextStyleExample(
              name: 'Montserrat Title Medium',
              style: kMontserratTextTheme.titleMedium!),
          TextStyleExample(
              name: 'Montserrat Title Small',
              style: kMontserratTextTheme.titleSmall!),
          TextStyleExample(
              name: 'Montserrat Label Large',
              style: kMontserratTextTheme.labelLarge!),
          TextStyleExample(
              name: 'Montserrat Label Medium',
              style: kMontserratTextTheme.labelMedium!),
          TextStyleExample(
              name: 'Montserrat Label Small',
              style: kMontserratTextTheme.labelSmall!),
          TextStyleExample(
              name: 'Montserrat Body Large',
              style: kMontserratTextTheme.bodyLarge!),
          TextStyleExample(
              name: 'Montserrat Body Medium',
              style: kMontserratTextTheme.bodyMedium!),
          TextStyleExample(
              name: 'Montserrat Body Small',
              style: kMontserratTextTheme.bodySmall!),
          const SizedBox(height: 7),
          TextStyleExample(
              name: 'Display Large', style: textTheme.displayLarge!),
          TextStyleExample(
              name: 'Display Medium', style: textTheme.displayMedium!),
          TextStyleExample(
              name: 'Display Small', style: textTheme.displaySmall!),
          TextStyleExample(
              name: 'Headline Large', style: textTheme.headlineLarge!),
          TextStyleExample(
              name: 'Headline Medium', style: textTheme.headlineMedium!),
          TextStyleExample(
              name: 'Headline Small', style: textTheme.headlineSmall!),
          TextStyleExample(name: 'Title Large', style: textTheme.titleLarge!),
          TextStyleExample(name: 'Title Medium', style: textTheme.titleMedium!),
          TextStyleExample(name: 'Title Small', style: textTheme.titleSmall!),
          TextStyleExample(name: 'Label Large', style: textTheme.labelLarge!),
          TextStyleExample(name: 'Label Medium', style: textTheme.labelMedium!),
          TextStyleExample(name: 'Label Small', style: textTheme.labelSmall!),
          TextStyleExample(name: 'Body Large', style: textTheme.bodyLarge!),
          TextStyleExample(name: 'Body Medium', style: textTheme.bodyMedium!),
          TextStyleExample(name: 'Body Small', style: textTheme.bodySmall!),
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
