import 'package:flutter/material.dart';
import 'package:regal/ledger.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.color,
      required this.onRefresh});

  final Widget child;
  final Color? backgroundColor;
  final Color? color;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: onRefresh,
        color: color ?? context.grey.shade700,
        backgroundColor: backgroundColor ?? context.grey.shade10,
        child: child,
      );
}
