import 'package:flutter/material.dart';

/// Helper class for device related operations.
///
class DeviceUtils {
  static double getScaledDefinesWidthSize(
          {required BuildContext context, required double percentage}) =>
      MediaQuery.of(context).size.width * percentage;

  static double getScaledDefinesHeightSize(
          {required BuildContext context, required double percentage}) =>
      MediaQuery.of(context).size.height * percentage;

  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}
