import '../../common_libs.dart';

class CustomSliverDesktopAppBar extends StatelessWidget {
  const CustomSliverDesktopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const String appBarTitleValue = 'Mercearia Dois Irmãos';
    const String cnpjTitleValue = '07.666.444/7773-29';
    const double collapsedHeightValue = 132.0;
    const double expandedHeightValue = 132.0;
    const String hintTextValue = 'Buscar produtos';
    const double toolbarHeight = 80;
    const double appBarLogoWidth = 156;
    const double appBarLogoHeight = 40;
    const double leftCenterTitleContentWidthPadding = 68.0;
    const String logoAssetPath =
        'assets/images/yandeh-colorful-logo-horizontal-with-icon.png';
    const double searchBarPadding = 18.0;
    const double maxSearchBarWidth = 500.0;
    const double minSearchBarHeight = 40.0;
    const double storeSelectorWidth = 256.0;
    const double dropDownArrowSize = 32.0;
    const double cardIconPositionIncenterTitleContent = -10.0;
    const double cartIconSize = 18.0;
    const String cartIconText = 'Carrinho';
    double contentWidth = LayoutUtils.getPageContentWidth(context);
    double centerTitleContentWidth = contentWidth + 100;

    return SliverAppBar(
      shadowColor: UiConstants.blackStar,
      forceElevated: true,
      backgroundColor: UiConstants.pureWhite,
      surfaceTintColor: UiConstants.snowBall,
      toolbarHeight: toolbarHeight,
      title: SizedBox(
        width: centerTitleContentWidth,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: leftCenterTitleContentWidthPadding,
                  ),
                  SizedBox(
                    width: appBarLogoWidth,
                    height: appBarLogoHeight,
                    child: Image.asset(
                      logoAssetPath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                      cacheHeight: appBarLogoHeight.toInt(),
                      cacheWidth: appBarLogoWidth.toInt(),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const SizedBox(
                    width: searchBarPadding,
                  ),
                  SearchBar(
                    constraints: const BoxConstraints(
                      maxWidth: maxSearchBarWidth,
                      minHeight: minSearchBarHeight,
                    ),
                    surfaceTintColor:
                        MaterialStateProperty.all(UiConstants.snowBall),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    hintText: hintTextValue,
                    trailing: const [
                      Icon(
                        Icons.search_rounded,
                        color: UiConstants.blackStar,
                      ),
                    ],
                    elevation:
                        MaterialStateProperty.all(UiConstants.elevationMedium),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: UiConstants.jeanGrey,
                            fontWeight: FontWeight.w400,
                            letterSpacing: UiConstants.letterSpaceMedium,
                          ),
                    ),
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: searchBarPadding,
                  ),
                  SizedBox(
                    width: storeSelectorWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              appBarTitleValue,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: UiConstants.blackStar,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing:
                                        UiConstants.letterSpaceExtraSmall,
                                    fontFamily: UiConstants.fontFamilyIntelo,
                                  ),
                            ),
                            Text(
                              cnpjTitleValue,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: UiConstants.jeanGrey,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing:
                                        UiConstants.letterSpaceMedium,
                                    fontFamily: UiConstants.fontFamilyIntelo,
                                  ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: dropDownArrowSize,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: UiConstants.paddingExtraLarge,
                  ),
                ],
              ),
              Positioned(
                right: cardIconPositionIncenterTitleContent,
                top: UiConstants.paddingExtraSmall,
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: cartIconSize,
                  ),
                  label: const Text(cartIconText),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(UiConstants.orangeLagrange),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: UiConstants.paddingLarge,
                        vertical: UiConstants.paddingMedium,
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: UiConstants.pureWhite,
                            fontWeight: FontWeight.w400,
                            letterSpacing: UiConstants.letterSpaceMedium,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      collapsedHeight: collapsedHeightValue,
      expandedHeight: expandedHeightValue,
      pinned: false, // set to true to keep the app bar visible
      floating: true,
      snap: true,
      centerTitle: true,
      flexibleSpace: _buildFlexibleSpaceBar(),
      // flexibleSpace: _buildFlexibleSpaceBar(),
    );
  }
}

Widget _buildFlexibleSpaceBar() {
  return const CustomFlexibleSpaceBarDesktop();
}
