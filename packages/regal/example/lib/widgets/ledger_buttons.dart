import 'package:flutter/material.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/ledger.dart';


class LedgerButtons extends StatelessWidget {
  const LedgerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Ledger Buttons'),
        Spacing.lds200.yBox,
        LedgerButton.primary1(
          trackLabel: 'trackLabel',
          label: 'primary1',
          loading: true,
          prefixIconPath: Assets.icons.infoFill,
          onPressed: () {
            showLedgerBottomSheet(
              context: context,
              title: 'This is an title , ' * 4,
              body: (context) => const Text('Hello'),
            );
          },
        ),
        Spacing.lds200.yBox,
        LedgerButton.primary2(
          trackLabel: 'trackLabel',
          label: 'primary2',
          loading: true,
          onPressed: () {},
          prefixIconPath: Assets.icons.infoFill,
        ),
        Spacing.lds200.yBox,
        LedgerButton.secondary(
          trackLabel: 'trackLabel',
          label: 'Secondary',
          prefixIconPath: Assets.icons.infoFill,
          onPressed: () {},
          loading: true,
        ),
        Spacing.lds200.yBox,
        LedgerButton.tertiary1(
          trackLabel: 'trackLabel',
          label: 'tertiary1',
          prefixIconPath: Assets.icons.infoFill,
          onPressed: () {},
          loading: true,
        ),
        Spacing.lds200.yBox,
        LedgerButton.tertiary2(
          trackLabel: 'trackLabel',
          label: 'tertiary2',
          size: LedgerButtonSize.small,
          prefixIconPath: Assets.icons.infoFill,
          onPressed: () {},
          loading: true,
        ),
        Spacing.lds200.yBox,
        LedgerButton.ghost(
          trackLabel: 'trackLabel',
          label: 'ghost',
          size: LedgerButtonSize.small,
          prefixIconPath: Assets.icons.infoFill,
          loading: true,
        ),
        Spacing.lds200.yBox,
      ],
    );
  }
}
