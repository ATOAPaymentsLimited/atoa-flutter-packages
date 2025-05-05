// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:regal/ledger.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
