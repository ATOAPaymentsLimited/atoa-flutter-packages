import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/ledger/ledger_theme/ledger_theme.dart';
import 'package:timelines/timelines.dart';

class ProgressTimeline extends StatelessWidget {
  const ProgressTimeline({
    super.key,
    required this.currentIndex,
    required this.count,
    this.dotSize,
  });

  final int currentIndex;
  final int count;
  final double? dotSize;

  double get _dotSize => dotSize ?? 12.sp;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (__, constraints) => SizedBox(
          width: double.infinity,
          height: 36.sp,
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              direction: Axis.horizontal,
              connectorTheme: const ConnectorThemeData(
                thickness: 1,
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
            builder: TimelineTileBuilder.connected(
              itemCount: count,
              connectionDirection: ConnectionDirection.before,
              itemExtentBuilder: (_, __) => constraints.maxWidth / count,
              indicatorBuilder: (context, index) {
                if (index < currentIndex) {
                  return Icon(
                    Icons.circle,
                    color: context.backgroundDark,
                    size: _dotSize,
                  );
                } else if (index == currentIndex) {
                  return Stack(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: _dotSize - 1,
                      ),
                      Icon(
                        Icons.circle_outlined,
                        color: context.backgroundDark,
                        size: _dotSize,
                      ),
                    ],
                  );
                }

                return Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: _dotSize,
                );
              },
              connectorBuilder: (context, index, type) {
                if (index <= currentIndex) {
                  return DecoratedLineConnector(
                    decoration: BoxDecoration(
                      color: context.backgroundDark,
                    ),
                  );
                }

                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    color: context.backgroundLight,
                  ),
                );
              },
            ),
          ),
        ),
      );
}
