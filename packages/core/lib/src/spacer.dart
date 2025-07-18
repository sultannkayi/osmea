import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoreSpacers {
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s48 = 48;
  static const double s56 = 56;
  static const double s64 = 64;
  static const double s80 = 80;
  static const double s96 = 96;
  static const double s112 = 112;
  static const double s128 = 128;
}

class CoreSpacer extends StatelessWidget {
  final double size;
  final Axis direction;
  final Color? color;
  final Key? widgetKey;

  const CoreSpacer({
    this.size = CoreSpacers.s16,
    this.direction = Axis.vertical,
    this.color,
    this.widgetKey,
  });

  @override
  Widget build(BuildContext context) {
    final Widget spacer = direction == Axis.vertical
        ? SizedBox(height: size, key: widgetKey)
        : SizedBox(width: size, key: widgetKey);

    if (!kDebugMode) return spacer;

    return direction == Axis.vertical
        ? Container(
            height: size,
            width: double.infinity,
            color: color ??
                const Color.fromARGB(255, 11, 194, 105).withOpacity(0.5),
            alignment: Alignment.center,
            child: Text(
              '${size.toInt()}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green[900],
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.white.withOpacity(0.9),
              ),
            ),
          )
        : Container(
            width: size,
            height: double.infinity,
            color: color ?? Colors.blue.withOpacity(0.7),
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                '${size.toInt()}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          );
  }
}

Widget vSpacer([double size = CoreSpacers.s16]) =>
    CoreSpacer(size: size, direction: Axis.vertical);
Widget hSpacer([double size = 16]) => Container(
      width: size,
      height: 40,
      color: Colors.blue.withOpacity(0.7),
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          '${size.toInt()}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
