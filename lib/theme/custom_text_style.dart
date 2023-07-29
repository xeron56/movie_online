import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  // Body text style
  static get bodyMediumBluegray800_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodyMediumBluegray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodyMediumBluegray500_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodyMediumBluegray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
