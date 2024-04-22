import '../../common_libs.dart';
// import '../../services/products_data_service.dart';
import 'package:y/mock/data_mock.dart';

class CustomSections extends StatefulWidget {
  const CustomSections({
    super.key,
  });

  @override
  State<CustomSections> createState() => _CustomSectionsState();
}

class _CustomSectionsState extends State<CustomSections> {
  late Future<Catalog> futureCatalog;

  @override
  void initState() {
    super.initState();
    // ApiService apiService = ApiService();
    // futureCatalog = apiService.fetchCatalog();
    MockService mockService = MockService();
    futureCatalog = mockService.fetchMockData();
  }

  @override
  Widget build(BuildContext context) {
    const String errorMessage = 'Ocorreu um erro ao carregar os dados.';
    const String voidErrorMessage = 'Nenhum dado disponível.';
    return FutureBuilder<Catalog>(
      future: futureCatalog,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: Text(errorMessage),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.sections.isEmpty) {
          return const SliverFillRemaining(
            child: Center(
              child: Text(voidErrorMessage),
            ),
          );
        }

        List<Section> sectionsNotEmpty = snapshot.data!.sections
            .where((element) => element.products.isNotEmpty)
            .toList();

        List<Color> sectionsColors = UiConstants().sectionsColors;

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index >= sectionsNotEmpty.length) {
                return null;
              }

              Color sectionColor =
                  sectionsColors[index % sectionsColors.length];

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildPromotionSection(index),
                  ProductSection(
                    section: sectionsNotEmpty[index],
                    backgroundColor:
                        sectionColor, // Pass the color to ProductSection
                  ),
                ],
              );
            },
            childCount: sectionsNotEmpty.length,
          ),
        );
      },
    );
  }

  Widget buildPromotionSection(int index) {
    const int firstPromotionBannerIndex = 2;
    const int secondPromotionBannerIndex = 4;
    if (index == firstPromotionBannerIndex) {
      return PromotionSection(
        emphasisContainerText: 'Queridinhos!',
        centerText: 'Veja os produtos mais queridos pelos nossos clientes.',
        assetGifReference: 'assets/images/promotion-1.gif',
        enphasisContainerColorValue: UiConstants.orangeLagrange,
      );
    } else if (index == secondPromotionBannerIndex) {
      return const PromotionSection(
        emphasisContainerText: 'Hortifruti Perfeito!',
        centerText: 'Veja opções fresquinhas para abastecer seu hortifruti.',
        assetGifReference: 'assets/images/promotion-2.gif',
        enphasisContainerColorValue: UiConstants.greenLight,
      );
    } else {
      return const SizedBox();
    }
  }
}
