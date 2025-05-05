import 'package:flutter/material.dart';
import 'package:regal/ledger.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      const Snackbar(
        SnackbarType.success(
          'Toast Header',
          description: 'Toast Subtext',
        ),
      ),
      const Snackbar(
        SnackbarType.error(
          'Toast Header',
          description: 'Toast Subtext',
        ),
      ),
      const Snackbar(
        SnackbarType.info(
          'Toast Header',
          description: 'Toast Subtext',
        ),
      ),
      const Snackbar(
        SnackbarType.success(
          'Toast Header',
        ),
      ),
      const Snackbar(
        SnackbarType.error(
          'Toast Header',
        ),
      ),
      const Snackbar(
        SnackbarType.info(
          'Toast Header',
        ),
      ),
      Snackbar(
        const SnackbarType.success(
          'Toast Header',
        ),
        onClose: () {},
      ),
      Snackbar(
        const SnackbarType.error(
          'Toast Header',
        ),
        onClose: () {},
      ),
      Snackbar(
        const SnackbarType.info(
          'Toast Header',
        ),
        onClose: () {},
      ),
      Snackbar(
        SnackbarType.success(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
        ),
      ),
      Snackbar(
        SnackbarType.error(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
        ),
      ),
      Snackbar(
        SnackbarType.info(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
        ),
      ),
      Snackbar(
        SnackbarType.success(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
        ),
        onClose: () {},
      ),
      Snackbar(
        SnackbarType.error(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
        ),
        onClose: () {},
      ),
      Snackbar(
        SnackbarType.info(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
        ),
        onClose: () {},
      ),
      Snackbar(
        SnackbarType.success(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
          headerIcon: const Icon(Icons.abc),
          headerText: 'Header Text',
        ),
        onClose: () {},
      ),
      Snackbar(
        SnackbarType.info(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
          headerIcon: const Icon(Icons.abc),
          headerText: 'Header Text',
        ),
        onClose: () {},
      ),
      Snackbar(
        SnackbarType.error(
          'Toast Header',
          ctaText: 'CTA',
          onCTA: () {},
          headerIcon: const Icon(Icons.abc),
          headerText: 'Header Text',
        ),
        onClose: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: children2
              .map(
                (e) => GestureDetector(
                  onTap: () => context.showSnackbar(e.snackbar),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
