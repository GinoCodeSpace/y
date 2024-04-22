import '../../../common_libs.dart';

class LayoutUtils {
  static double getDeviceWidth(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth;
  }

  static bool isDesktopSmall(double deviceWidth) {
    bool isDesktop = deviceWidth > 900;
    return isDesktop;
  }

  static bool isDesktopLarge(double deviceWidth) {
    bool isDesktop = deviceWidth > 1200;
    return isDesktop;
  }

  static double getPageContentWidth(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 1168.0 : double.infinity;
  }

  static double getResponsiveLayoutPadding(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopSmall(deviceWidth)
        ? UiConstants.desktopPadding
        : UiConstants.paddingMedium;
  }

  static double getResponsiveHeroCardHeightSize(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 115.0 : 112.0;
  }

  static double getResponsiveHeroCardWidthSize(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 280.0 : 208.0;
  }

  static double getResponsiveHeroCardPaddingSize(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth)
        ? UiConstants.paddingLarge
        : UiConstants.paddingMedium;
  }

  static double getResponsiveHeroCardImageLeftPosition(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 146.0 : 112.0;
  }

  static double getResponsiveProductCardSpacing(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth)
        ? UiConstants.paddingMedium
        : UiConstants.paddingExtraExtraSmall;
  }

  static double getResponsiveLayoutWidthSize(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 1168.0 : double.infinity;
  }

  static double getResponsivePromotionContainerHeight(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 280.0 : 184.0;
  }

  static double getResponsivePromotionChildContainerWidth(
      BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 360.0 : 172.0;
  }

  static double getResponsiveHeroEmphasisContainerHeightValue(
      BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 60.0 : 32.0;
  }

  static double getResponsivePromotionlinkButtonHeightValue(
      BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 28.0 : 24.0;
  }

  static double getResponsivePromotionlinkButtonWidthValue(
      BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 160.0 : 100.0;
  }

  static double getResponsiveHeroEmphasisContainerWidthValue(
      BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 360.0 : 172.0;
  }

  static double getResponsiveHeroCarouselTopSpace(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopSmall(deviceWidth) ? UiConstants.paddingExtraLarge : UiConstants.paddingMedium;
  }

  static double getResponsiveProductSectionBackgroungHeightValue(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 412.0 : 376.0;
  }

  static double getResponsiveProductSectionCardsCarouselPositionLeftValue(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 8.0 : 0.0;
  }

  static double getResponsiveProductSectionCardsCarouselPositionTopValue(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 92.0 : 74.0;
  }

  static double getResponsiveProductSectionHeightValue(BuildContext context) {
    double deviceWidth = getDeviceWidth(context);
    return isDesktopLarge(deviceWidth) ? 500.0 : 480.0;
  }
}
