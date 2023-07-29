import 'package:flutter/material.dart';
import 'package:crack_tech/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get outline => BoxDecoration(
        border: Border.all(
          color: appTheme.blueGray50,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutline => BoxDecoration(
        color: appTheme.gray90001,
        border: Border.all(
          color: appTheme.gray90001,
          width: getHorizontalSize(
            1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000c,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get txtOutline1 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray100,
          width: getHorizontalSize(
            1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000c,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius txtCircleBorder18 = BorderRadius.circular(
    getHorizontalSize(
      18,
    ),
  );

  static BorderRadius circleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
