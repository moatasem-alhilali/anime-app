import 'package:flutter/material.dart';
// DeviceScreenType >

enum DeviceScreenType { mobile, tablet, desktop }

class SizingInformation {
  final Orientation? orientation;

  final DeviceScreenType? deviceScreenType;

  final Size? screenSize;

  final Size? localWidgetSize;

  SizingInformation(
      {this.orientation,
      this.deviceScreenType,
      this.screenSize,
      this.localWidgetSize});

  @override
  String toString() {
    return 'Orientation:$orientation DeviceScreenType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
// Get DeviceType >

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 950) {
    return DeviceScreenType.desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const BaseWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize:
              Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
        );

        return builder(context, sizingInformation);
      },
    );
  }
}
