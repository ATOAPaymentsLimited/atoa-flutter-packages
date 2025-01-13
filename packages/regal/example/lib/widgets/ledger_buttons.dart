import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class LedgerButtons extends StatelessWidget {
  const LedgerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Ledger Buttons'),
        Spacing.large.yBox,
        LedgerButton.primary1(
          trackLabel: 'trackLabel',
          label: 'primary1',
          loading: true,
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
        LedgerButton.primary2(
          trackLabel: 'trackLabel',
          label: 'primary2',
          loading: true,
          onPressed: () {},
          prefixIcon: const Icon(Icons.download),
        ),
        Spacing.large.yBox,
        LedgerButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Secondary',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),Spacing.large.yBox,
        LedgerButton.tertiary1(
          trackLabel: 'trackLabel',
          label: 'tertiary1',
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        LedgerButton.tertiary2(
          trackLabel: 'trackLabel',
          label: 'tertiary2',
          size: LedgerButtonSize.small,
          prefixIcon: const Icon(Icons.download),
          onPressed: () {},
          loading: true,
        ),
        Spacing.large.yBox,
        const LedgerButton.ghost(
          trackLabel: 'trackLabel',
          label: 'ghost',
          size: LedgerButtonSize.small,
          prefixIcon: Icon(Icons.download),
          loading: true,
        ),
        Spacing.large.yBox,
      ],
    );
  }
}
