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
  static const yellow = Color(0xffffd21e);
  static const orange = Color(0xffff976a);
  static const orangeDark = Color(0xffed6a0c);
  static const orangeLight = Color(0xfffffbe8);
  static const green = Color(0xff07c160);
  static const transparent = Colors.transparent;

  // Gradient Colors
  static const gradientRed =
      LinearGradient(colors: [Color(0xffff6034), Color(0xffee0a24)]);
  static const gradientOrange =
      LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)]);

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
  static const fontWeightBold = FontWeight.w500;

  // interval
  static const intervalBase = 2.0;
  static const intervalSm = intervalBase * 2;
  static const intervalMd = intervalBase * 3;
  static const intervalLg = intervalBase * 4;
  static const intervalXl = intervalBase * 6;

  // BoxShadow
  static const boxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 4.0, // has the effect of softening the shadow
    spreadRadius: 0, // has the effect of extending the shadow
    offset: Offset(
      0, // horizontal, move right 10
      0, // vertical, move down 10
    ),
  );

  // Animation
  static const animationDurationBase = Duration(milliseconds: 500);
  static const animationDurationFast = Duration(milliseconds: 300);
  static const animationDurationSlow = Duration(milliseconds: 1000);

  // Border
  static const borderColor = gray3;
  static const borderWidthBase = 1.0;
  static const borderWidthHair = 0.5;
  static const borderRadiusSm = 2.0;
  static const borderRadiusMd = 4.0;
  static const borderRadiusLg = 8.0;
  static const borderRadiusMax = 999.0;

  // ActionSheet
  static const actionSheetHeaderPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
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
  static const addressEditButtonsPadding =
      EdgeInsets.symmetric(vertical: paddingXl, horizontal: paddingBase);
  static const addressEditButtonMarginBottom = paddingSm;
  static const addressEditSwitchHeight = 20.0;
  static const addressEditSwitchColor = blue;

  // AddressList
  static const addressListPadding = EdgeInsets.all(paddingSm);
  static const addressListDisabledTextColor = gray6;
  static const addressListDisabledTextPadding =
      EdgeInsets.symmetric(vertical: paddingLg);
  static const addressListDisabledTextFontSize = fontSizeMd;
  static const addressListTitleFontSize = fontSizeLg;
  static const addressListItemPadding = EdgeInsets.all(paddingSm);
  static const addressListItemBackground = white;
  static const addressListItemTextColor = textColor;
  static const addressListItemDisabledTextColor = gray5;
  static const addressListItemFontSize = 13.0;
  static const addressListItemRadioIconColor = red;
  static const addressListItemRadioIconFontSize = 20.0;
  static const addressListEditIconSize = 18.0;
  static const addressListEditIconColor = gray6;
  static const addressListAddPadding =
      EdgeInsets.symmetric(vertical: paddingSm, horizontal: paddingSm);
  static const addressListAddBackground = white;

  // Avatar
  static const avatarWidthBase = 28.0;
  static const avatarWidthSm = 24.0;
  static const avatarWidthLg = 32.0;
  static const avatarBorderRaidus = borderRadiusMd;
  static const avatarRoundBorderRaidus = borderRadiusMax;
  static const avatarBackgroundColor = gray3;
  static const avatarIconColor = textColor;

  // Badge
  static const badgeDotPadding = 5.0;
  static const badgeValuePadding =
      EdgeInsets.symmetric(vertical: 2.0, horizontal: paddingBase);
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

  // Calendar
  static const calendarBorderRadius = 20.0;
  static const calendarBackgroundColor = white;
  static const calendarPopHeight = .8;
  static const calendarHeaderBoxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 10.0, // has the effect of softening the shadow
    spreadRadius: 0, // has the effect of extending the shadow
    offset: Offset(
      0, // horizontal, move right 10
      2, // vertical, move down 10
    ),
  );
  static const calendarFontColor = textColor;
  static const calendarHeight = 400.0;
  static const calendarTitleHeight = 44.0;
  static const calendarTitleFontSize = fontSizeLg;
  static const calendarWeekdaysHeight = 30.0;
  static const calendarWeekdaysFontSize = fontSizeMd;
  static const calendarMonthTitleFontSize = fontSizeMd;
  static const calendarMonthMarkColor = gray2;
  static const calendarMonthMarkSize = 200.0;
  static const calendarMonthMarkFontSize = 150.0;
  static const calendarDayHeight = 60.0;
  static const calendarDayFontSize = fontSizeLg;
  static const calendarDayBorderRadius = borderRadiusMd;
  static const calendarRangeEdgeColor = white;
  static const calendarRangeEdgeBackgroundColor = blue;
  // static const calendarRangeMiddleColor = white;fieldInputPadding
  static const calendarRangeMiddleBackgroundOpacity = .1;
  static const calendarSelectedDaySize = 54.0;
  static const calendarSelectedDayColor = white;
  static const calendarInfoFontSize = fontSizeXs;
  static const calendarSelectedDayBackgroundColor = blue;
  static const calendarDayDisabledColor = gray5;
  static const calendarConfirmPadding =
      EdgeInsets.symmetric(vertical: 7.0, horizontal: paddingMd);
  static const calendarConfirmButtonHeight = 36.0;

  // Card
  static const cardPadding =
      EdgeInsets.symmetric(vertical: paddingSm, horizontal: paddingMd);
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
  static const cellVerticalPadding = paddingSm;
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
  static const cellGroupTitlePadding = EdgeInsets.only(
      left: paddingMd, top: paddingMd, right: paddingMd, bottom: paddingXs);
  static const cellGroupTitleFontSize = fontSizeMd;

  // Checkbox
  static const checkboxSize = 20.0;
  static const checkboxBackgroundColor = white;
  static const checkboxBorderColor = gray5;
  static const checkboxLabelMargin = paddingXs;
  static const checkboxLabelColor = textColor;
  static const checkboxCheckedIconColor = blue;
  static const checkboxDisabledIconColor = gray5;
  static const checkboxDisabledLabelColor = gray5;
  static const checkboxDisabledBackgroundColor = borderColor;

  // Circle
  static const circleSize = 120.0;
  static const circleTextColor = textColor;
  static const circleTextFontSize = 14.0;

  // Collapse
  static const collapseItemTransitionDuration = animationDurationBase;
  static const collapseItemContentPadding =
      EdgeInsets.fromLTRB(0, paddingMd, paddingMd, paddingMd);
  static const collapseItemContentMargin = EdgeInsets.only(left: paddingMd);
  static const collapseItemContentFontSize = 13.0;
  static const collapseItemContentTextColor = gray6;
  static const collapseItemContentBackgroundColor = white;
  static const collapseItemTitleDisabledColor = gray5;

  // CountDown
  static const countDownTextColor = textColor;
  static const countDownFontSize = fontSizeMd;

  // Coupon
  static const couponMargin = EdgeInsets.only(bottom: paddingMd);
  static const couponContentPadding =
      EdgeInsets.fromLTRB(paddingMd, paddingMd, paddingMd, paddingLg);
  static const couponBackgroundColor = white;
  static const couponBorderRadius = borderRadiusMd;
  static const couponBoxShadow = boxShadow;
  static const couponFontSize = fontSizeSm;
  static const couponColor = gray6;
  static const couponHeadWidth = 80.0;
  static const couponHeadHeight = 24.0;
  static const couponAmountColor = red;
  static const couponIconSize = 20.0;
  static const couponIconSelectedColor = red;
  static const couponNameFontSize = 20.0;
  static const couponNameColor = textColor;
  static const couponDisabledTextColor = gray6;
  static const couponDescriptionPadding =
      EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingMd);
  static const couponDescriptionBackgroundColor = backgroundColorLight;
  static const couponDescriptionFontSize = fontSizeSm;
  static const couponDescriptionColor = gray6;

  // CouponList
  static const couponListPadding = EdgeInsets.all(16);
  static const couponListBackgroundColor = backgroundColor;
  static const couponListExchangeButtonWidth = 60.0;
  static const couponListEmptyImageSize = 200.0;
  static const couponListEmptyTipColor = gray6;
  static const couponListEmptyTipFontSize = fontSizeMd;
  static const couponListTabBackground = white;
  static const couponListTabLabelColor = textColor;
  static const couponListTabUnselectedLabelColor = gray6;
  static const couponListTabIndicatorColor = blue;
  static const couponListCloseButtonHeight = 50.0;
  static const couponListCloseButtonBackground = white;
  static const couponListCloseButtonFontSize = 16.0;
  static const couponListCloseButtonColor = textColor;

  // Dialog
  static const dialogWidth = 320.0;
  static const dialogSmallScreenWidth = 280.0;
  static const dialogFontSize = fontSizeLg;
  static const dialogBorderRadius = 16.0;
  static const dialogTextColor = textColor;
  static const dialogBackgroundColor = white;
  static const dialogHeaderFontWeight = fontWeightBold;
  static const dialogHeaderPadding =
      EdgeInsets.fromLTRB(paddingLg, paddingLg, paddingLg, 0);
  static const dialogMessagePadding = paddingLg;
  static const dialogMessageFontSize = fontSizeMd;
  static const dialogHasTitleMessageTextColor = gray7;
  static const dialogHasTitleMessagePaddingTop = paddingSm;
  static const dialogConfirmButtonTextColor = blue;
  static const dialogCancelButtonTextColor = textColor;
  static const dialogButtonHeight = 50.0;

  // Divider
  static const dividerTextColor = gray6;
  static const dividerFontSize = fontSizeMd;
  static const dividerBorderColor = borderColor;
  static const dividerContentPadding = EdgeInsets.symmetric(horizontal: 10);
  static const dividerContentLeftWidth = 32.0;
  static const dividerContentRightWidth = 32.0;

  // DropdownMenu
  static const dropdownMenuHeight = 50.0;
  static const dropdownMenuBackgroundColor = white;
  static const dropdownMenuTitleFontSize = 15.0;
  static const dropdownMenuTitleTextColor = textColor;
  static const dropdownMenuTitleActiveTextColor = blue;
  static const dropdownMenuTitleDisabledTextColor = gray6;
  static const dropdownMenuTitlePadding =
      EdgeInsets.symmetric(horizontal: paddingXs);
  static const dropdownMenuOptionActiveColor = white;
  static const dropdownMenuContentMaxHeight = 200.0;

  // Field
  static const fieldLabelWidth = 80.0;
  static const fieldMinHeight = 30.0;
  static const fieldFontSize = fontSizeMd;
  static const fieldPadding =
      EdgeInsets.symmetric(horizontal: paddingMd, vertical: 10);
  static const fieldInputPadding = EdgeInsets.symmetric(vertical: 5);
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

  // GoodsAction
  static const goodsActionBackgroundColor = white;
  static const goodsActionIconWidth = 48.0;
  static const goodsActionIconHeight = 50.0;
  static const goodsActionIconColor = textColor;
  static const goodsActionIconSize = 18.0;
  static const goodsActionFontSize = fontSizeXs;
  static const goodsActionIconTextColor = gray7;
  static const goodsActionButtonsPadding =
      EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingSm);
  static const goodsActionButtonHeight = 40.0;

  // ImagePreview
  static const imagePreviewIndexTextColor = white;
  static const imagePreviewIndexFontSize = fontSizeMd;
  static const imagePreviewImageHeight = 280.0;
  static const imagePreviewDuration = animationDurationSlow;

  // ImageWall
  static const imageWallPadding = EdgeInsets.symmetric(horizontal: paddingSm);
  static const imageWallCloseButtonColor = gray6;
  static const imageWallCloseButtonFontSize = 16.0;
  static const imageWallItemSize = 80.0;
  static const imageWallItemGutter = 10.0;
  static const imageWallItemBorderRadius = 4.0;
  static const imageWallUploadBorderColor = borderColor;
  static const imageWallUploadBackground = white;
  static const imageWallUploadSize = 18.0;
  static const imageWallUploadColor = gray6;

  // List
  static const listIconMarginRight = EdgeInsets.only(right: 5.0);
  static const listTextColor = gray6;
  static const listTextFontSize = fontSizeMd;
  static const listTextHeight = 50.0;

  // Loading
  static const loadingTextColor = gray6;
  static const loadingTextFontSize = fontSizeMd;
  static const loadingSpinnerColor = blue;
  static const loadingSpinnerBackgroundColor = gray5;
  static const loadingSpinnerSize = 30.0;
  static const loadingSpinnerWidth = 2.0;
  static const loadingSpinnerAnimationDuration = Duration(milliseconds: 800);

  // NoticeBar
  static const noticeBarHeight = 40.0;
  static const noticeBarPadding =
      EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingMd);
  static const noticeBarFontSize = fontSizeMd;
  static const noticeBarTextColor = orangeDark;
  static const noticeBarBackgroundColor = orangeLight;
  static const noticeBarIconSize = 16.0;

  // NumberKeyBoard
  static const numberKeyboardBackgroundColor = white;
  static const numberKeyboardTitleTextColor = gray7;
  static const numberKeyboardTitlePadding =
      EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingMd);
  static const numberKeyboardTitleFontSize = fontSizeMd;
  static const numberKeyboardCloseColor = blue;
  static const numberKeyboardCloseFontSize = fontSizeMd;
  static const numberKeyboardNumSpacing = 0.6;
  static const numberKeyboardKeyBackground = gray3;
  static const numberKeyboardKeyFontSize = 24.0;
  static const numberKeyboardDeleteFontSize = fontSizeLg;

  // Pagination
  static const paginationHeight = 40.0;
  static const paginationButtonPadding = 20.0;
  static const paginationItemPadding = 10.0;
  static const paginationFontSize = fontSizeMd;
  static const paginationItemBackground = white;
  static const paginationItemColor = green;
  static const paginationActiveItemBackground = green;
  static const paginationActiveItemColor = white;
  static const paginationDescColor = gray7;
  static const paginationDisabledOpacity = disabledOpacity;

  // Panel
  static const panelBackgroundColor = white;
  static const panelHeaderValueFontSize = fontSizeMd;
  static const panelHeaderValueColor = red;
  static const panelContentPadding = 20.0;
  static const panelFooterPadding =
      EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingMd);

  // PasswordInput
  static const passwordInputHeight = 52.0;
  static const passwordInputMargin =
      EdgeInsets.symmetric(horizontal: paddingMd);
  static const passwordInputFontSize = 20.0;
  static const passwordInputColor = textColor;
  static const passwordInputGutter = 6.0;
  static const passwordInputBorderRadius = 6.0;
  static const passwordInputBackgroundColor = white;
  static const passwordInputInfoColor = gray6;
  static const passwordInputInfoFontSize = fontSizeMd;

  // Picker
  static const pickerBackgroundColor = white;
  static const pickerHeight = 260.0;
  static const pickerToolbarHeight = 44.0;
  static const pickerTitleFontSize = fontSizeLg;
  static const pickerActionPadding =
      EdgeInsets.symmetric(horizontal: paddingMd);
  static const pickerActionFontSize = fontSizeMd;
  static const pickerActionTextColor = blue;
  static const pickerOptionFontSize = fontSizeLg;
  static const pickerOptionTextColor = black;
  static const pickerLoadingIconColor = blue;
  static const pickerLoadingMaskColor = Colors.white70;

  // Price
  static const priceFontSize = 20.0;
  static const priceTextColor = textColor;
  static const priceIntegetFontWeight = fontWeightBold;

  // Progress
  static const progressHeight = 4.0;
  static const progressDisabledColor = gray5;
  static const progressBackgroundColor = gray3;
  static const progressMargin = EdgeInsets.symmetric(vertical: 10);
  static const progressPivotPadding =
      EdgeInsets.symmetric(horizontal: 6, vertical: 2);
  static const progressColor = blue;
  static const progressPivotFontSize = fontSizeSm;
  static const progressPivotTextColor = white;

  // Rate
  static const rateHorizontalGutter = 4.0;
  static const rateIconSize = 24.0;
  static const rateDisabledColor = gray5;
  static const rateActiveColor = yellow;
  static const rateInactiveColor = gray4;

  // Search
  static const searchBackgroundColor = white;
  static const searchInputBackgroundColor = gray1;
  static const searchPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: paddingSm);
  static const searchInputFontSize = fontSizeMd;
  static const searchInputPlaceholderColor = gray6;
  static const searchInputColor = textColor;
  static const searchLabelPadding = EdgeInsets.symmetric(horizontal: 5);
  static const searchLabelColor = textColor;
  static const searchLabelFontSize = fontSizeMd;
  static const searchLeftIconColor = gray6;
  static const searchActionPadding = EdgeInsets.only(left: paddingXs);
  static const searchActionTextColor = textColor;
  static const searchActionFontSize = fontSizeMd;

  // Skeleton
  static const skeletonRowHeight = 16.0;
  static const skeletonTitleHeight = 20.0;
  static const skeletonRowBackgroundColor = activeColor;
  static const skeletonRowMarginBottom = EdgeInsets.only(bottom: paddingSm);
  static const skeletonAvatarSize = 36.0;
  static const skeletonAvatarBackgroundColor = activeColor;
  static const skeletonAvatarMarginRight = EdgeInsets.only(right: paddingSm);

  // SidebarItem
  static const sidebarFontSize = fontSizeMd;
  static const sidebarTextColor = textColor;
  static const sidebarDisabledTextColor = gray5;
  static const sidebarPadding = EdgeInsets.fromLTRB(paddingXs, 20, 40, 20);
  static const sidebarActiveColor = activeColor;
  static const sidebarBackgroundColor = backgroundColorLight;
  static const sidebarSelectedFontWeight = fontWeightBold;
  static const sidebarSelectedTextColor = textColor;
  static const sidebarSelectedBorderWidth = 3.0;
  static const sidebarSelectedBorderColor = red;
  static const sidebarSelectedBackgroundColor = white;

  // Steps
  static const stepsPadding = EdgeInsets.all(paddingSm);
  static const stepsBorderWidth = borderWidthBase;
  static const stepsBorderColor = borderColor;
  static const stepsBackgroundColor = white;

  // Step
  static const stepTextColor = gray6;
  static const stepProcessTextColor = textColor;
  static const stepFontSize = fontSizeMd;
  static const stepLineColor = borderColor;
  static const stepFinishLineColor = green;
  static const stepFinishTextColor = textColor;
  static const stepIconSize = 14.0;
  static const stepCircleSize = 8.0;
  static const stepCircleColor = gray6;
  static const stepHorizontalTitleFontSize = fontSizeSm;
  static const stepVerticalProgressWidth = 20.0;

  // Stepper
  static const stepperHeight = 28.0;
  static const stepperBackgroundColor = gray2;
  static const stepperButtonWidth = 28.0;
  static const stepperButtonIconColor = textColor;
  static const stepperButtonIconSize = fontSizeMd;
  static const stepperButtonDisabledColor = backgroundColor;
  static const stepperDisabledIconColor = gray5;
  static const stepperInputWidth = 32.0;
  static const stepperInputFontSize = fontSizeMd;
  static const stepperInputTextColor = textColor;
  static const stepperInputDisabledTextColor = gray5;
  static const stepperInputDisabledBackgroundColor = activeColor;
  static const stepperBorderRadius = borderRadiusMd;

  // SubmitBar
  static const submitBarHeight = 50.0;
  static const submitBarBackgroundColor = white;
  static const submitBarButtonWidth = 110.0;
  static const submitBarPriceColor = red;
  static const submitBarPriceFontSize = 20.0;
  static const submitBarTextColor = textColor;
  static const submitBarTextFontSize = fontSizeMd;
  static const submitBarTipPadding =
      EdgeInsets.symmetric(vertical: paddingXs, horizontal: paddingSm);
  static const submitBarTipFontSize = fontSizeSm;
  static const submitBarTipColor = Color(0xfff56723);
  static const submitBarTipBackgroundColor = Color(0xfffff7cc);
  static const submitBarTipIconSize = 12.0;
  static const submitBarButtonHeight = 40.0;
  static const submitBarButtonColor = gradientRed;
  static const submitBarPadding = EdgeInsets.symmetric(horizontal: paddingMd);

  // Swipe
  static const swipeIndicatorSize = 8.0;
  static const swipeIndicatorInacticeOpacity = 0.3;
  static const swipeIndicatorActiceBackgroundColor = blue;
  static const swipeIndicatorInacticeBackgroundColor = borderColor;
  static const swipeDuration = animationDurationSlow;

  // Tag
  static const tagPadding =
      EdgeInsets.symmetric(vertical: 2, horizontal: paddingBase);
  static const tagMargin = EdgeInsets.only(right: intervalLg);
  static const tagFontSize = fontSizeXs;
  static const tagMediumFontSize = fontSizeSm;
  static const tagLargeFontSize = fontSizeMd;
  static const tagTextColor = white;
  static const tagBorderRadius = borderRadiusSm;
  static const tagRoundBorderRadius = borderRadiusMax;
  static const tagDangerColor = red;
  static const tagPrimaryColor = blue;
  static const tagSuccessColor = green;
  static const tagWarningColor = orange;
  static const tagDefaultColor = gray6;
  static const tagPlainBackgroundColor = white;

  // TreeSelect
  static const treeSelectFontSize = fontSizeMd;
  static const treeSelectNavBackgroundColor = backgroundColorLight;
  static const treeSelectContentBackgroundColor = white;
  static const treeSelectContentPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 15);
  static const treeSelectItemColor = textColor;
  static const treeSelectItemFontWeight = fontWeightBold;
  static const treeSelectItemActiveColor = red;
  static const treeSelectItemDisabledColor = gray5;
}
