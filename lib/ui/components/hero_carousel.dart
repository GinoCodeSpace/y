import '../../common_libs.dart';

class HeroCarousel extends StatelessWidget {
  HeroCarousel({
    super.key,
  });

  final List<Map> cardCarouselItems = [
    {
      'image': 'assets/images/legumes.png',
      'title': 'Legumes',
      'color': UiConstants.greenDay,
    },
    {
      'image': 'assets/images/frutas.png',
      'title': 'Frutas',
      'color': UiConstants.greenLight,
    },
    {
      'image': 'assets/images/temperos.png',
      'title': 'Temperos',
      'color': UiConstants.guavaMusse,
    }
  ];

  @override
  Widget build(BuildContext context) {
    const double heroCarouselHeight = 130;
    double heroCardPaddingSize =
        LayoutUtils.getResponsiveHeroCardPaddingSize(context);
    return SizedBox(
      height: heroCarouselHeight,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.paddingExtraExtraLarge,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: cardCarouselItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index > 0
                ? EdgeInsets.only(
                    left: heroCardPaddingSize,
                  )
                : EdgeInsets.zero,
            child: HeroCarouselCard(
              title: cardCarouselItems[index]['title'],
              color: cardCarouselItems[index]['color'],
              image: cardCarouselItems[index]['image'],
            ),
          );
        },
      ),
    );
  }
}
