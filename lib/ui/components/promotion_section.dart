import '../../common_libs.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({
    super.key,
    required this.emphasisContainerText,
    required this.centerText,
    required this.assetGifReference,
    required this.enphasisContainerColorValue,
  });

  final String emphasisContainerText;

  final String centerText;

  final String assetGifReference;

  final Color enphasisContainerColorValue;

  @override
  Widget build(BuildContext context) {
    const double linkButtonBorderSideWidthValue = 1.0;
    const String linkButtonText = 'Ver mais';
    const double customLocalFontSizeDesktop = 20.0;
    const double customLocalFontSizeDesktopCenterText = 12.0;
    const double customLocalFontSizeMobile = 12.0;

    double layoutPadding = LayoutUtils.getResponsiveLayoutPadding(context);

    double promotionContainerWidthValue =
        LayoutUtils.getResponsiveLayoutWidthSize(context);

    double promotionContainerHeightValue =
        LayoutUtils.getResponsivePromotionContainerHeight(context);

    double promotionChildContainerWidthValue =
        LayoutUtils.getResponsiveChildPromotionContainerWidth(context);

    double emphasisContainerHeightValue =
        LayoutUtils.getResponsiveHeroEmphasisContainerHeightValue(context);

    double emphasisContainerWidthValue =
        LayoutUtils.getResponsivePromotionChildContainerWidth(context);

    bool isDesktop =
        LayoutUtils.isDesktopLarge(LayoutUtils.getDeviceWidth(context));

    double linkButtonHeightValue =
        LayoutUtils.getResponsivePromotionlinkButtonHeightValue(
      context,
    );

    double linkButtonWidthValue =
        LayoutUtils.getResponsivePromotionlinkButtonWidthValue(
      context,
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: UiConstants.paddingExtraLarge,
        left: layoutPadding,
        right: layoutPadding,
      ),
      child: Container(
        height: promotionContainerHeightValue,
        width: promotionContainerWidthValue,
        padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.paddingMedium,
          vertical: UiConstants.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: UiConstants.ocyan,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              UiConstants.borderRadiusLarge,
            ),
          ),
          image: DecorationImage(
            image: AssetImage(
              assetGifReference,
            ),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              const SizedBox();
            },
            filterQuality: FilterQuality.high,
          ),
        ),
        child: SizedBox(
          width: promotionChildContainerWidthValue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      emphasisContainerWidthValue + UiConstants.paddingMedium,
                ),
                child: Container(
                  height: emphasisContainerHeightValue,
                  width: emphasisContainerWidthValue,
                  decoration: BoxDecoration(
                    color: enphasisContainerColorValue,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        UiConstants.borderRadiusLarge,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      emphasisContainerText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: UiConstants.snowBall,
                            fontWeight: FontWeight.bold,
                            fontSize: isDesktop ? 35 : 18,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isDesktop
                    ? UiConstants.paddingMedium
                    : UiConstants.paddingSmall,
              ),
              SizedBox(
                width: promotionChildContainerWidthValue +
                    UiConstants.paddingMedium,
                child: Text(
                  centerText,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: UiConstants.snowBall,
                        fontWeight: FontWeight.w500,
                        fontSize: isDesktop
                            ? customLocalFontSizeDesktop
                            : customLocalFontSizeMobile,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: isDesktop
                    ? UiConstants.paddingMedium
                    : UiConstants.paddingSmall,
              ),
              Container(
                height: linkButtonHeightValue,
                width: linkButtonWidthValue,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      UiConstants.borderRadiusLarge,
                    ),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: UiConstants.snowBall,
                      width: linkButtonBorderSideWidthValue,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    linkButtonText,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: UiConstants.snowBall,
                          fontSize: isDesktop
                              ? customLocalFontSizeDesktopCenterText
                              : customLocalFontSizeMobile,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
