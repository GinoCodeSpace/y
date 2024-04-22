import '../../common_libs.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    const double productCardHeightValue = 392;
    const double productCardWidthValue = 182;
    const double productCardImageHeightValue = 182;
    const String productImageAssetReference = 'assets/images/tomate.png';
    const String bottomCardText = 'Yandeh';
    const double productNameContainerHeight = 40.0;
    const double eanContainerHeight = 20;
    const double packageContainerHeight = 36;
    const double localCustomFontSize = 12;
    return Card(
      borderOnForeground: false,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: productCardHeightValue,
        width: productCardWidthValue,
        decoration: const BoxDecoration(
          color: UiConstants.pureWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(
              UiConstants.borderRadiusSmall,
            ),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: UiConstants.paddingMedium,
                ),
                SizedBox(
                  height: productCardImageHeightValue,
                  width: productCardWidthValue,
                  child: Image.asset(
                    productImageAssetReference,
                    fit: BoxFit.contain,
                    errorBuilder: (context, exception, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          color: UiConstants.greenDay,
                        ),
                      );
                    },
                    filterQuality: FilterQuality.high,
                    cacheHeight: productCardImageHeightValue.toInt(),
                    cacheWidth: productCardWidthValue.toInt(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(UiConstants.paddingSmall),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${product.formattedPrice.toString()} ${product.unitType ?? ''}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing:
                                        UiConstants.letterSpaceExtraSmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: UiConstants.paddingMedium,
                        ),
                        SizedBox(
                          height: productNameContainerHeight,
                          child: Text(
                            product.name.toTitleCase(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: UiConstants.letterSpaceSmall,
                                ),
                            textAlign: TextAlign.left,
                            maxLines: UiConstants.doubleLine,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: UiConstants.paddingExtraSmall),
                          decoration: const BoxDecoration(
                            color: UiConstants.blueJeansLight,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                UiConstants.borderRadiusExtraExtraSmall,
                              ),
                            ),
                          ),
                          child: Text(
                            product.formattedUnitContent,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontSize: localCustomFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: eanContainerHeight,
                          child: SelectableText(
                            product.ean,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontSize: localCustomFontSize,
                                  fontWeight: FontWeight.w400,
                                ),
                            maxLines: UiConstants.doubleLine,
                          ),
                        ),
                        const SizedBox(
                          height: UiConstants.paddingSmall,
                        ),
                        SizedBox(
                          height: packageContainerHeight,
                          child: Center(
                            child: Text(
                              '${product.packageQuantity.toString().toTitleCase()} ${product.package.toTitleCase()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: UiConstants.letterSpaceSmall,
                                  ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            bottomCardText,
                            style: Theme.of(context).textTheme.labelSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: UiConstants.paddingSmall,
              top: UiConstants.paddingSmall,
              child: FloatingActionButton(
                elevation: UiConstants.elevationNone,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      UiConstants.borderRadiusLarge,
                    ),
                  ),
                ),
                mini: true,
                onPressed: () {},
                backgroundColor: UiConstants.orangeLagrange,
                child: const Icon(
                  Icons.add,
                  color: UiConstants.pureWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
