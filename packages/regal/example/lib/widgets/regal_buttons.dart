import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class RegalButtons extends StatelessWidget {
  const RegalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Regal Buttons'),
        Spacing.large.yBox,
        const Text('Large'),
        Spacing.large.yBox,
        RegalButton.primary(
          trackLabel: 'trackLabel',
          label: 'Show Bottom Sheet',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {
            showRegalBottomSheet(
              context: context,
              title: 'This is an title , ' * 4,
              body: (context) => const Text('Hello'),
            );
          },
        ),
        Spacing.large.yBox,
        const RegalButton.primary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: Icon(Icons.download),
        ),
        Spacing.large.yBox,
        RegalButton.primary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        const Text('Small'),
        Spacing.large.yBox,
        RegalButton.primary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
        ),
        Spacing.large.yBox,
        const RegalButton.primary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: Icon(Icons.download),
        ),
        Spacing.large.yBox,
        RegalButton.primary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        const Text('Large'),
        Spacing.large.yBox,
        RegalButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
        ),
        Spacing.large.yBox,
        const RegalButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: Icon(Icons.download),
        ),
        Spacing.large.yBox,
        RegalButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        const Text('Small'),
        Spacing.large.yBox,
        RegalButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: const Icon(Icons.download),
          size: RegalButtonSize.small,
          onPressed: () {},
        ),
        Spacing.large.yBox,
        const RegalButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: Icon(Icons.download),
        ),
        Spacing.large.yBox,
        RegalButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        const Text('Large'),
        Spacing.large.yBox,
        RegalButton.tertiary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
        ),
        Spacing.large.yBox,
        const RegalButton.tertiary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: Icon(Icons.download),
        ),
        Spacing.large.yBox,
        RegalButton.tertiary(
          trackLabel: 'trackLabel',
          label: 'Download',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        const Text('Small'),
        Spacing.large.yBox,
        RegalButton.tertiary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
        ),
        Spacing.large.yBox,
        const RegalButton.tertiary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: Icon(Icons.download),
        ),
        Spacing.large.yBox,
        RegalButton.tertiary(
          trackLabel: 'trackLabel',
          label: 'Download',
          size: RegalButtonSize.small,
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
      ],
    );
  }
}
