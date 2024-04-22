import '../../common_libs.dart';

class CustomSliverMobileAppBar extends StatelessWidget {
  const CustomSliverMobileAppBar({super.key});

  String get cnpjTitleValue => '05.892.738/0001-24';

  String get appBarTitleValue => 'Mercadinho Maristela';

  @override
  Widget build(BuildContext context) {
    const double collapsedHeightValue = 108.0;
    const double expandedHeightValue = 108.0;
    return SliverAppBar(
      shadowColor: UiConstants.blackStar,
      backgroundColor: UiConstants.pureWhite,
      surfaceTintColor: UiConstants.snowBall,
      forceElevated: true,
      title: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appBarTitleValue),
            Text(
              cnpjTitleValue,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: UiConstants.snowBall,
          ),
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              UiConstants.orangeLagrange,
            ),
          ),
        ),
        const SizedBox(
          width: UiConstants.paddingSmall,
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      collapsedHeight: collapsedHeightValue,
      expandedHeight: expandedHeightValue,
      pinned: false, // set to true to keep the app bar visible
      floating: true,
      snap: true,
      flexibleSpace: CustomFlexibleSpaceBarMobile(),
    );
  }
}
