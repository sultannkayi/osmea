import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

/// Simple Device Frame Wrapper for Components App
///
/// This widget wraps the components app in a simple device frame when running on web
/// to provide a mobile-like preview experience.
class DeviceFrameWrapper extends StatelessWidget {
  final Widget child;

  const DeviceFrameWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Only show device frame on web platform
    if (!kIsWeb) {
      return child;
    }

    // On web, wrap with device frame and provide Directionality
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OsmeaComponents.center(
        child: OsmeaComponents.padding(
          padding: context.paddingMedium,
          child: Transform.scale(
            scale: context.scaleLowValue,
            child: DeviceFrame(
              device: Devices.ios.iPhone16ProMax,
              screen: child,
            ),
          ),
        ),
      ),
    );
  }
}
