import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/utils/enums.dart';

class Responsive {
  static DeviceType getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width >= 1250) {
      return DeviceType.largeDesktop;
    } else if (width >= 1024) {
      return DeviceType.desktop;
    } else if (width >= 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  static bool isLargeDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.largeDesktop;

  static bool isDesktopOrLarger(BuildContext context) {
    final device = getDeviceType(context);
    return device == DeviceType.desktop || device == DeviceType.largeDesktop;
  }

  static bool isTabletOrLarger(BuildContext context) {
    final device = getDeviceType(context);
    return device != DeviceType.mobile;
  }

  static double getValue(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) {
    switch (getDeviceType(context)) {
      case DeviceType.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }

  static T getWidget<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    switch (getDeviceType(context)) {
      case DeviceType.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }
}
