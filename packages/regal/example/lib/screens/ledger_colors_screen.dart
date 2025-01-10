import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regal/regal.dart';

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
                    padding: Spacing.tiny.all,
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
          context.baseColors.black,
          context.baseColors.white,
          Colors.transparent,
          context.intactColors.white,
          context.intactColors.black,
          Colors.transparent,
          context.backgroundColors.light,
          context.backgroundColors.dark,
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
          context.neutralColors.grey.shade10,
          context.neutralColors.grey.shade50,
          context.neutralColors.grey.shade100,
          context.neutralColors.grey.shade200,
          context.neutralColors.grey.shade300,
          context.neutralColors.grey.shade400,
          context.neutralColors.grey.shade500,
          context.neutralColors.grey.shade600,
          context.neutralColors.grey.shade700,
          context.neutralColors.grey.shade800,
          context.neutralColors.grey.shade900,
          Colors.transparent,
          context.brandColors.primary.shade10,
          context.brandColors.primary.shade50,
          context.brandColors.primary.shade100,
          context.brandColors.primary.shade200,
          context.brandColors.primary.shade300,
          context.brandColors.primary.shade400,
          context.brandColors.primary.shade500,
          context.brandColors.primary.shade600,
          context.brandColors.primary.shade700,
          context.brandColors.primary.shade800,
          context.brandColors.primary.shade900,
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
