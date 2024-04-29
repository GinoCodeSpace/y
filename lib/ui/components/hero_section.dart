import '../../common_libs.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double imageHeroContainerHeight = 280;
    const double bottonSpaceToEndOfCarousel = 37.0;
    const double logoImageContainerBottonSpace = 56.0;
    const double logoImageWidth = 240;
    const double logoImageHeight = 60;

    const String heroGifReference = 'assets/images/hero-gif.gif';
    const String logoImageReference =
        'assets/images/yandeh-logo-horizontal-with-icon.png';

    double layoutPadding = LayoutUtils.getResponsiveLayoutPadding(context);

    double heroContainerWidth = LayoutUtils.getResponsiveLayoutWidthSize(context);

    double topSpaceToHeroCarousel = LayoutUtils.getResponsiveHeroCarouselTopSpace(
      context,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: topSpaceToHeroCarousel,
                left: layoutPadding,
                right: layoutPadding,
                bottom: bottonSpaceToEndOfCarousel,
              ),
              child: Container(
                height: imageHeroContainerHeight,
                width: heroContainerWidth,
                decoration: BoxDecoration(
                  color: UiConstants.greenDay,
                  borderRadius: BorderRadius.circular(
                    UiConstants.borderRadiusLarge,
                  ),
                  image: DecorationImage(
                    image: const AssetImage(
                      heroGifReference,
                    ),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      const SizedBox();
                    },
                    filterQuality: FilterQuality.high,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: logoImageContainerBottonSpace,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UiConstants.paddingMedium,
                      ),
                      child: Image.asset(
                        logoImageReference,
                        width: logoImageWidth,
                        height: logoImageHeight,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            HeroCarousel(),
          ],
        ),
        const SizedBox(
          height: UiConstants.paddingExtraLarge,
        )
      ],
    );
  }
}
