import 'package:flutter/material.dart';

class UIHelper {
  static const double _verticalSpaceVerySmall = 5.0;
  static const double _verticalSpaceSmall = 10.0;
  static const double _verticalSpaceMedium = 20.0;
  static const double _verticalSpaceLarge = 60.0;

  static const double _horizontalSpaceTiny = 5.0;
  static const double _horizontalSpaceSmall = 10.0;
  static const double _horizontalSpaceMedium = 20.0;
  static const double _horizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceVerySmall =
      SizedBox(height: _verticalSpaceVerySmall);
  static const Widget verticalSpaceSmall =
      SizedBox(height: _verticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _verticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _verticalSpaceLarge);

  static const Widget horizontalSpaceVeryTiny =
      SizedBox(width: _horizontalSpaceTiny);
  static const Widget horizontalSpaceSmall =
      SizedBox(width: _horizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _horizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _horizontalSpaceLarge);
}
