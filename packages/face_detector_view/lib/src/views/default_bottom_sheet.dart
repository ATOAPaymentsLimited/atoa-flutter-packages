import 'package:flutter/material.dart';

class DefaultBottomSheet extends StatelessWidget {
  final Widget? bottomSheet;

  const DefaultBottomSheet({
    Key? key,
    this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bottomSheet ??
        BottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          onClosing: () {},
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 4.0,
                  ),
                  Text(
                    "Scan your face",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            );
          },
        );
  }
}
