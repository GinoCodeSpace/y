import '../../common_libs.dart';

class CustomFlexibleSpaceBarMobile extends StatelessWidget {
  CustomFlexibleSpaceBarMobile({
    super.key,
  });

  final List<String> categories = [
    'Todas categorias',
    'Campanhas',
    'Frutas Yandeh',
    'Higiene',
    'Limpeza',
    'Padaria',
    'Pet',
    'Utilidades',
  ];

  @override
  Widget build(BuildContext context) {
    const double expandedTitleScaleValue = 1;

    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      titlePadding: EdgeInsets.zero,
      expandedTitleScale: expandedTitleScaleValue,
      centerTitle: false,
      title: SizedBox(
        height: UiConstants.paddingExtraExtraLarge,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: UiConstants.paddingMedium,
            right: UiConstants.paddingMedium,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: UiConstants.paddingExtraSmall,
              ),
              child: CategoryNavItemMobile(
                categoryTitle: categories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryNavItemMobile extends StatelessWidget {
  const CategoryNavItemMobile({
    super.key,
    required this.categoryTitle,
  });

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: UiConstants.paddingSmall),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                  horizontal: UiConstants.borderRadiusMedium),
            ),
            overlayColor: MaterialStateProperty.all(
              UiConstants.deepblue,
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return UiConstants.pureWhite;
                }
                return UiConstants.deepblue;
              },
            ),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.labelMedium,
            ),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: UiConstants.jeanGrey,
                width: UiConstants.borderSideWidthMedium,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  UiConstants.borderRadiusExtraSmall,
                ),
              ),
            ),
          ),
          child: Text(
            categoryTitle,
          ),
        ),
      ),
    );
  }
}
