import 'package:flutter/material.dart';

class WebBottomSheet extends StatelessWidget {
  const WebBottomSheet({super.key, required this.button});

  final Widget button;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(168, 177, 192, 1),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 4.0,
            ),
            button,
            Text(
              "Scan your face",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
