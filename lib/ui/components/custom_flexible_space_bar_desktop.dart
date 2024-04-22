import '../../common_libs.dart';

class CustomFlexibleSpaceBarDesktop extends StatelessWidget {
  const CustomFlexibleSpaceBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Todas as categorias',
      'Campanhas',
      'Frutas Yandeh',
      'Indústrias e marcas',
      'Pedidos',
      'Importação de pedidos',
    ];

    const double expandedTitleScaleValue = 1;

    const double titleTopPadding = 80.0;

    double contentWidth = LayoutUtils.getPageContentWidth(context);

    String firstCategory = categories[0];

    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      titlePadding: const EdgeInsets.only(
        top: titleTopPadding,
      ),
      expandedTitleScale: expandedTitleScaleValue,
      centerTitle: false,
      title: Center(
        child: SizedBox(
          height: UiConstants.paddingExtraExtraLarge,
          width: contentWidth,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: UiConstants.paddingMedium,
              right: UiConstants.paddingMedium,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (index == 0)
                    CategoryNavItemDesktop(
                      categoryTitle: firstCategory,
                      hasChildren: true,
                    )
                  else
                    CategoryNavItemDesktop(
                      categoryTitle: categories[index],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryNavItemDesktop extends StatefulWidget {
  const CategoryNavItemDesktop({
    super.key,
    required this.categoryTitle,
    this.hasChildren = false,
  });

  final String categoryTitle;
  final bool hasChildren;

  @override
  State<CategoryNavItemDesktop> createState() => _CategoryNavItemDesktopState();
}

class _CategoryNavItemDesktopState extends State<CategoryNavItemDesktop> {
  @override
  Widget build(BuildContext context) {
    const double navIconSize = 16;
    const double navLetterSpacing = 0.25;
    return Container(
      decoration: BoxDecoration(
        color: UiConstants.pureWhite,
        borderRadius: BorderRadius.circular(
          UiConstants.borderRadiusMedium,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.hasChildren ? 0 : UiConstants.paddingMedium,
          right: UiConstants.paddingMedium,
        ),
        child: TextButton.icon(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              UiConstants.orangeLagrange,
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered) ||
                    states.contains(MaterialState.selected) ||
                    states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return UiConstants.pureWhite;
                }
                return UiConstants.blackStar;
              },
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: widget.hasChildren
                    ? Theme.of(context).textTheme.labelLarge?.fontSize
                    : Theme.of(context).textTheme.labelMedium?.fontSize,
                fontWeight:
                    widget.hasChildren ? FontWeight.w600 : FontWeight.w600,
                letterSpacing: navLetterSpacing,
              ),
            ),
          ),
          onPressed: () {},
          icon: widget.hasChildren
              ? const Icon(
                  Icons.menu,
                  size: navIconSize,
                )
              : const SizedBox(),
          label: Text(
            widget.categoryTitle,
          ),
        ),
      ),
    );
  }
}
