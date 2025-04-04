import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regal/ledger/atoa_dls.dart';

class LedgerColorsScreen extends StatefulWidget {
  const LedgerColorsScreen({super.key});

  @override
  State<LedgerColorsScreen> createState() => _LedgerColorsScreenState();
}

class _LedgerColorsScreenState extends State<LedgerColorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        final state = context.select((ThemeMode mode) => mode);
        return CupertinoSegmentedControl<ThemeMode>(
          children: Map.fromEntries(
            ThemeMode.values.map(
              (e) => MapEntry(
                  e,
                  Padding(
                    padding: Spacing.lds25.all,
                    child: Text(e.name),
                  )),
            ),
          ),
          groupValue: state,
          onValueChanged: context.themeModeNotifier.onValueChanged,
        );
      }),
      body: ListView(
        children: [
          context.baseBlack,
          context.baseWhite,
          Colors.transparent,
          context.intactWhite,
          context.intactBlack,
          Colors.transparent,
          context.backgroundLight,
          context.backgroundDark,
          Colors.transparent,
          context.error.subtle,
          context.error.lighter,
          context.error.defaultColor,
          context.error.darker,
          context.error.deep,
          Colors.transparent,
          context.notice.subtle,
          context.notice.lighter,
          context.notice.defaultColor,
          context.notice.darker,
          context.notice.deep,
          Colors.transparent,
          context.negative.subtle,
          context.negative.lighter,
          context.negative.defaultColor,
          context.negative.darker,
          context.negative.deep,
          Colors.transparent,
          context.positive.subtle,
          context.positive.lighter,
          context.positive.defaultColor,
          context.positive.darker,
          context.positive.deep,
          Colors.transparent,
          context.info.subtle,
          context.info.lighter,
          context.info.defaultColor,
          context.info.darker,
          context.info.deep,
          Colors.transparent,
          context.grey.shade10,
          context.grey.shade50,
          context.grey.shade100,
          context.grey.shade200,
          context.grey.shade300,
          context.grey.shade400,
          context.grey.shade500,
          context.grey.shade600,
          context.grey.shade700,
          context.grey.shade800,
          context.grey.shade900,
          Colors.transparent,
          context.primary.shade10,
          context.primary.shade50,
          context.primary.shade100,
          context.primary.shade200,
          context.primary.shade300,
          context.primary.shade400,
          context.primary.shade500,
          context.primary.shade600,
          context.primary.shade700,
          context.primary.shade800,
          context.primary.shade900,
        ].map((e) {
          if (e.toString() == "Color(0x00000000)") {
            return const ListTile(
              title: Text('----'),
            );
          }
          return ListTile(
            leading: ColoredBox(
              color: e,
              child: const SizedBox.square(dimension: 100),
            ),
            title: Text(e.toString()),
          );
        }).toList(),
      ),
    );
  }
}
