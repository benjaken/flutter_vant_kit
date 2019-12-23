import 'package:flutter/material.dart';

class Style {
  static const black = Colors.black;
  static const white = Colors.white;
  static const gray1 = Color(0xfff7f8fa);
  static const gray2 = Color(0xfff2f3f5);
  static const gray3 = Color(0xffebedf0);
  static const gray4 = Color(0xffdcdee0);
  static const gray5 = Color(0xffc8c9cc);
  static const gray6 = Color(0xff969799);
  static const gray7 = Color(0xff646566);
  static const gray8 = Color(0xff323233);
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
  static const textColor = gray8;
  static const activeColor = gray2;
  static const activeOpacity = 0.7;
  static const disabledOpacity = 0.5;
  static const backgroundColor = gray1;
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

  // interval
  static const intervalBase = 2.0;
  static const intervalSm = intervalBase * 2;
  static const intervalMd = intervalBase * 3;
  static const intervalLg = intervalBase * 4;

  // Animation
  static const animationDurationBase = Duration(milliseconds: 300);
  static const animationDurationFast = Duration(milliseconds: 200);

  // Border
  static const borderColor = gray3;
  static const borderWidthBase = 1.0;
  static const borderWidthHair = 0.5;
  static const borderRadiusSm = 2.0;
  static const borderRadiusMd = 4.0;
  static const borderRadiusLg = 8.0;
  static const borderRadiusMax = 999.0;
  
  // ActionSheet
  static const actionSheetHeaderPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const actionSheetHeaderFontSize = fontSizeLg;
  static const actionSheetHeaderBorderRadius = 20.0;
  static const actionSheetDescriptionColor = gray7;
  static const actionSheetDescriptionFontSize = fontSizeMd;
  static const actionSheetItemHeight = 50.0;
  static const actionSheetItemBackground = white;
  static const actionSheetItemFontSize = fontSizeLg;
  static const actionSheetItemTextColor = textColor;
  static const actionSheetItemDisabledTextColor = gray5;
  static const actionSheetSubnameColor = gray7;
  static const actionSheetSubnameFontSize = fontSizeSm;
  static const actionSheetCloseIconSize = 18.0;
  static const actionSheetCloseIconColor = gray6;
  static const actionSheetCloseIconPadding = paddingSm;
  static const actionSheetCancelPaddingTop = paddingXs;
  static const actionSheetCancelPaddingColor = backgroundColor;

  // AddressEdit
  static const addressEditPadding = paddingSm;
  static const addressEditButtonsPadding = EdgeInsets.symmetric(vertical: paddingXl, horizontal: paddingBase);
  static const addressEditButtonMarginBottom = paddingSm;
  // static const addressEditDetailFinishColor = blue;
  // static const addressEditDetailFinishFontSize = fontSizeSm;

  // AddressList

  // Avatar
  static const avatarWidthBase = 24.0;
  static const avatarWidthSm = 20.0;
  static const avatarWidthLg = 28.0;
  static const avatarBorderRaidus = borderRadiusMd;
  static const avatarRoundBorderRaidus = borderRadiusMax;
  static const avatarBackgroundColor = gray3;
  static const avatarIconColor = textColor;

  // Badge
  static const badgeDotPadding = 5.0;
  static const badgeValuePadding = EdgeInsets.symmetric(vertical: 2.0, horizontal: paddingBase);
  static const badgeTextColor = white;
  static const badgeBackgroundColor = red;
  static const badgeTextFontSize = 12.0;

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
  static const cardPadding = EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingMd);
  static const cardFontSize = fontSizeSm;
  static const cardTextColor = textColor;
  static const cardBackgroundColor = white;
  static const cardThumbSize = 88.0;
  static const cardThumbBorderRadius = borderRadiusLg;
  static const cardDescColor = gray7;
  static const cardOriginPriceColor = gray6;
  static const cardNumColor = gray6;
  static const cardOriginPriceFontSize = fontSizeSm;

  // Cell
  static const cellFontSize = fontSizeMd;
  static const cellVerticalPadding = 10.0;
  static const cellHorizontalPadding = paddingMd;
  static const cellTextColor = textColor;
  static const cellBackgroundColor = white;
  static const cellBorderColor = borderColor;
  static const cellRequiredColor = red;
  static const cellLabelColor = gray6;
  static const cellLabelFontSize = fontSizeSm;
  static const cellValueColor = gray6;
  static const cellIconSize = 16.0;
  static const cellRightIconColor = gray6;
  static const cellLargeVerticalPadding = paddingSm;
  static const cellLargeTitleFontSize = fontSizeLg;
  static const cellLargeLabelFontSize = fontSizeMd;

  // CellGroup
  static const cellGroupBackgroundColor = white;
  static const cellGroupTitleColor = gray6;
  static const cellGroupTitlePadding = EdgeInsets.only(left: paddingMd, top: paddingMd, right: paddingMd, bottom: paddingXs);
  static const cellGroupTitleFontSize = fontSizeMd;

  // Checkbox
  static const checkboxSize = 20.0;
  static const checkboxBackgroundColor= white;
  static const checkboxBorderColor = gray5;
  // static const checkboxTransitionDuration = animationDurationFast;
  static const checkboxLabelMargin = paddingXs;
  static const checkboxLabelColor = textColor;
  static const checkboxCheckedIconColor = blue;
  static const checkboxDisabledIconColor = gray5;
  static const checkboxDisabledLabelColor = gray5;
  static const checkboxDisabledBackgroundColor = borderColor;

  // Circle

  // Collapse
  static const collapseItemTransitionDuration = animationDurationBase;
  static const collapseItemContentPadding = EdgeInsets.fromLTRB(0, paddingMd, paddingMd, paddingMd);
  static const collapseItemContentMargin = EdgeInsets.only(left: paddingMd);
  static const collapseItemContentFontSize = 13.0;
  static const collapseItemContentTextColor = gray6;
  static const collapseItemContentBackgroundColor = white;
  static const collapseItemTitleDisabledColor = gray5;

  // CountDown

  // Coupon

  // CouponCell

  // CouponList

  // Dialog

  // Divider
  static const dividerTextColor = gray6;
  static const dividerFontSize = fontSizeMd;
  static const dividerBorderColor = borderColor;
  static const dividerContentPadding = EdgeInsets.symmetric(horizontal: 10);
  static const dividerContentLeftWidth = 32.0;
  static const dividerContentRightWidth = 32.0;

  // DropdownMenu

  // Field
  static const fieldLabelWidth = 80.0;
  static const fieldFontSize = fontSizeMd;
  static const fieldInputPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const fieldInputBackgroundColor = white;
  static const fieldInputTextColor = textColor;
  static const fieldInputCursorWidth = 1.0;
  static const fieldRequiredColor = red;
  static const fieldInputErrorTextColor = red;
  static const fieldInputDisabledTextColor = gray6;
  static const fieldPlaceholderTextColor = gray6;
  static const fieldIconSize = 16.0;
  static const fieldClearIconSize = 16.0;
  static const fieldClearIconColor = gray5;
  static const fieldRightIconColor = gray6;
  static const fieldErrorMessageColor = red;
  static const fieldErrorMessageTextSize = 12.0;
  static const fieldWordLimitColor = gray7;
  static const fieldWordLimitFontSize = fontSizeSm;

// @field-text-area-min-height: 60px;
// @field-word-limit-line-height: 16px;

  // GoodsAction
  static const goodsActionBackgroundColor = white;
  static const goodsActionIconWidth = 48.0;
  static const goodsActionIconHeight = 50.0;
  static const goodsActionIconColor = textColor;
  static const goodsActionIconSize = 18.0;
  static const goodsActionFontSize = fontSizeXs;
  static const goodsActionIconTextColor = gray7;
  static const goodsActionButtonsPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  static const goodsActionButtonHeight = 40.0;
}