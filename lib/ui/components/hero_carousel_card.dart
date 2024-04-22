import '../../common_libs.dart';

class HeroCarouselCard extends StatelessWidget {
  const HeroCarouselCard({
    super.key,
    required this.title,
    required this.color,
    required this.image,
  });

  final String title;
  final String image;
  final Color color;

  

  @override
  Widget build(BuildContext context) {
    
    double heroCardHeight = LayoutUtils.getResponsiveHeroCardHeightSize(context);
    double heroCardWidth = LayoutUtils.getResponsiveHeroCardWidthSize(context);
    double leftPositionWhereTheImageStarts = LayoutUtils.getResponsiveHeroCardImageLeftPosition(context);
    const double rightPositionWhereTheImageEnds = 0;
    const double imageContainerWidth = 180.0;
    const double imageContainerHeight = 124.0;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          UiConstants.borderRadiusMedium,
        ),
      ),
      child: Container(
        width: heroCardWidth,
        height: heroCardHeight,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              UiConstants.borderRadiusMedium,
            ),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: UiConstants.paddingMedium,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: UiConstants.pureWhite,
                      ),
                ),
              ),
            ),
            Positioned(
              left: leftPositionWhereTheImageStarts,
              top: rightPositionWhereTheImageEnds,
              child: Container(
                width: imageContainerWidth,
                height: imageContainerHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.fill,
                    onError: (exception, stackTrace) {
                      const SizedBox();
                    },
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
