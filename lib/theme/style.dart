import 'package:flutter/material.dart';

class Style {
  static const black = Colors.black;
  static const white = Colors.white;
  static const grey1 = Color(0xfff7f8fa);
  static const grey2 = Color(0xfff2f3f5);
  static const grey3 = Color(0xffebedf0);
  static const grey4 = Color(0xffdcdee0);
  static const grey5 = Color(0xffc8c9cc);
  static const grey6 = Color(0xff969799);
  static const grey7 = Color(0xff646566);
  static const grey8 = Color(0xff323233);
  static const red = Color(0xffee0a24);
  static const blue = Color(0xff1989fa);
  static const orange = Color(0xffff976a);
  static const orangeDark = Color(0xffed6a0c);
  static const orangeLight = Color(0xfffffbe8);
  static const green = Color(0xff07c160);

  // Gradient Colors
  static const gradientRed = LinearGradient(colors: [Color(0xffff6034), Color(0xffee0a24)]);
  static const gradientOrange = LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)]);

  // Component Colors
  static const textColor = grey8;
  static const activeColor = grey2;
  static const activeOpacity = 0.7;
  static const disabledOpacity = 0.5;
  static const backgroundColor = grey1;
  static const backgroundColorLight = Color(0xfffafafa);

  // padding
  static const paddingBase = 4.0;
  static const paddingXs = paddingBase * 2;
  static const paddingSm = paddingBase * 3;
  static const paddingMd = paddingBase * 4;
  static const paddingLg = paddingBase * 6;
  static const paddingXl = paddingBase * 8;

  // Font
  static const fontSizeXs = 10.0;
  static const fontSizeSm = 12.0;
  static const fontSizeMd = 14.0;
  static const fontSizeLg = 16.0;
  static const fontWeightBold= FontWeight.w500;

  // Animation
  static const animationDurationBase = Duration(milliseconds: 300);
  static const animationDurationFast = Duration(milliseconds: 200);

  // Border
  static const borderColor = grey3;
  static const borderWidthBase = 1.0;
  static const borderWidthHair = 0.5;
  static const borderRadiusSm = 2.0;
  static const borderRadiusMd = 4.0;
  static const borderRadiusLg = 8.0;
  static const borderRadiusMax = 999.0;
  
  // ActionSheet

  // AddressEdit

  // AddressList

  // Avatar

  // Badge

  // Button
  static const buttonMiniHeight = 22.0;
  static const buttonMiniFontSize = fontSizeXs;
  static const buttonSmallHeight = 30.0;
  static const buttonSmallFontSize = fontSizeSm;
  static const buttonDefaultHeight = 44.0;
  static const buttonDefaultFontSize = fontSizeMd;
  static const buttonLargeHeight = 50.0;
  static const buttonLargeFontSize = fontSizeLg;
  static const buttonDefaultColor = textColor;
  static const buttonDefaultBackgroundColor = white;
  static const buttonDefaultBorderColor = borderColor;
  static const buttonPrimaryColor = white;
  static const buttonPrimaryBackgroundColor = green;
  static const buttonPrimaryBorderColor = green;
  static const buttonInfoColor = white;
  static const buttonInfoBackgroundColor = blue;
  static const buttonInfoBorderColor = blue;
  static const buttonDangerColor = white;
  static const buttonDangerBackgroundColor = red;
  static const buttonDangerBorderColor = red;
  static const buttonWarningColor = white;
  static const buttonWarningBackgroundColor = orange;
  static const buttonWarningBorderColor = orange;
  static const buttonBorderWidth = borderWidthBase;
  static const buttonHairBorderWidth = borderWidthHair;
  static const buttonBorderRadius = borderRadiusSm;
  static const buttonRoundBorderRadius = borderRadiusMax;
  static const buttonPlainBackgroundColor = white;
  static const buttonDisabledOpacity = disabledOpacity;

  // Card

  // Cell
  static const cellFontSize = fontSizeMd;
  static const cellVerticalPadding = 10.0;
  static const cellHorizontalPadding = paddingMd;
  static const cellTextColor = textColor;
  static const cellBackgroundColor = white;
  static const cellBorderColor = borderColor;
  static const cellRequiredColor = red;
  static const cellLabelColor = grey6;
  static const cellLabelFontSize = fontSizeSm;
  static const cellValueColor = grey6;
  static const cellIconSize = 16.0;
  static const cellRightIconColor = grey6;
  static const cellLargeVerticalPadding = paddingSm;
  static const cellLargeTitleFontSize = fontSizeLg;
  static const cellLargeLabelFontSize = fontSizeMd;

  // CellGroup
  static const cellGroupBackgroundColor = white;
  static const cellGroupTitleColor = grey6;
  static const cellGroupTitlePadding = EdgeInsets.only(left: paddingMd, top: paddingMd, right: paddingMd, bottom: paddingXs);
  static const cellGroupTitleFontSize = fontSizeMd;

}