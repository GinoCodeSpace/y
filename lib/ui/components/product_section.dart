import '../../common_libs.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({
    required this.section,
    super.key,
    required this.backgroundColor,
  });

  final Section section;
  final Color backgroundColor;

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  final ScrollController scrollController = ScrollController();
  bool showLeftButton = false;
  bool showRightButton = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_updateScrollButtons);
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateScrollButtons);
    scrollController.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    if (!mounted) return;
    setState(() {
      showLeftButton = scrollController.offset > 0;
      showRightButton =
          scrollController.offset < scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double cardsCarouselHeightValue = 392;
    const double carouselTitleContainerPadding = 12.0;

    double containerBackgroundHeightValue =
        LayoutUtils.getResponsiveProductSectionBackgroungHeightValue(context);

    double layoutPadding = LayoutUtils.getResponsiveLayoutPadding(context);
    double productCardSpacingValue =
        LayoutUtils.getResponsiveProductCardSpacing(context);
    double containerBackgroundWidthValue =
        LayoutUtils.getResponsiveLayoutWidthSize(context);
    bool isDesktopLarge =
        LayoutUtils.isDesktopLarge(LayoutUtils.getDeviceWidth(context));

    double cardsCarouselPositionLeftValue =
        LayoutUtils.getResponsiveProductSectionCardsCarouselPositionLeftValue(
            context);

    double cardsCarouselPositionTopValue =
        LayoutUtils.getResponsiveProductSectionCardsCarouselPositionTopValue(
            context);

    double productSectionHeightValue =
        LayoutUtils.getResponsiveProductSectionHeightValue(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: UiConstants.paddingMedium,
        left: layoutPadding,
        right: layoutPadding,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktopLarge
                  ? UiConstants.paddingExtraExtraLarge
                  : UiConstants.paddingNone,
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: productSectionHeightValue,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Container(
                        height: containerBackgroundHeightValue,
                        width: containerBackgroundWidthValue,
                        padding: EdgeInsets.all(isDesktopLarge
                            ? UiConstants.paddingLarge
                            : UiConstants.paddingMedium),
                        decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                            isDesktopLarge
                                ? UiConstants.borderRadiusLarge
                                : UiConstants.borderRadiusMedium,
                          )),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: UiConstants.paddingExtraExtraLarge,
                              decoration: const BoxDecoration(
                                color: UiConstants.snowBall,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    UiConstants.borderRadiusExtraLarge)),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: UiConstants.paddingMedium,
                                      right: UiConstants.paddingSmall),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.section.section,
                                        textAlign: TextAlign.left,
                                        style: isDesktopLarge
                                            ? Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                          width: UiConstants.paddingMedium),
                                      isDesktopLarge
                                          ? Text(
                                              widget.section
                                                  .getFormattedDescription(),
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          : const SizedBox(),
                                      const Spacer(),
                                      isDesktopLarge
                                          ? Container(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal:
                                                      carouselTitleContainerPadding),
                                              height:
                                                  UiConstants.paddingExtraLarge,
                                              decoration: BoxDecoration(
                                                color: UiConstants.snowBall,
                                                borderRadius: const BorderRadius
                                                    .all(
                                                    Radius.circular(UiConstants
                                                        .borderRadiusMedium)),
                                                border: Border.all(
                                                  color: UiConstants.jeanGrey,
                                                  width: UiConstants
                                                      .borderSideWidthMedium,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Ver ${widget.section.products.length} itens',
                                                  textAlign: TextAlign.right,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: cardsCarouselPositionLeftValue,
                  top: cardsCarouselPositionTopValue,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      int sensitivity = 8;
                      if (details.delta.dx > sensitivity) {
                        scrollCarousel(-0.5);
                      } else if (details.delta.dx < -sensitivity) {
                        scrollCarousel(0.5);
                      }
                    },
                    child: SizedBox(
                      height: cardsCarouselHeightValue,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.only(
                          left: isDesktopLarge
                              ? UiConstants.paddingMedium
                              : UiConstants.paddingExtraSmall,
                          right: isDesktopLarge ? 1000 : 40,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.section.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index > 0
                                  ? productCardSpacingValue
                                  : UiConstants.paddingNone,
                            ),
                            child: ProductCard(
                                product: widget.section.products[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isDesktopLarge && showRightButton)
            Positioned(
              right: 20,
              top: productSectionHeightValue / 2 - 20,
              child: FloatingActionButton(
                onPressed: () => scrollCarousel(0.5),
                backgroundColor: UiConstants.snowBall,
                child: const Icon(Icons.arrow_forward_ios,
                    color: UiConstants.jeanGrey),
              ),
            ),
          if (isDesktopLarge && showLeftButton)
            Positioned(
              left: 20,
              top: productSectionHeightValue / 2 - 20,
              child: FloatingActionButton(
                onPressed: () => scrollCarousel(-0.5),
                backgroundColor: UiConstants.snowBall,
                child: const Icon(Icons.arrow_back_ios_new,
                    color: UiConstants.jeanGrey),
              ),
            ),
        ],
      ),
    );
  }

  void scrollCarousel(double offsetMultiplier) {
    if (!scrollController.hasClients) {
      return;
    }

    double viewportWidth = MediaQuery.of(context).size.width;
    double targetOffset =
        scrollController.offset + viewportWidth * offsetMultiplier;

    scrollController.animateTo(
      targetOffset.clamp(0, scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }
}
