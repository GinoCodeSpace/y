import '../common_libs.dart';

class Section {
  String section;
  String description;
  List<Product> products;

  Section({
    required this.section,
    required this.description,
    required this.products,
  });

  @override
  String toString() {
    return 'Section{section: $section, description: $description, products: $products}';
  }

  factory Section.fromJson(Map<String, dynamic> json) {
    if (json['section'] == null ||
        json['description'] == null ||
        json['products'] == null) {
      throw Exception(
          'Missing fields in JSON data; required: section, description, products');
    }

    List<Product> productList;
    try {
      productList = (json['products'] as List<dynamic>)
          .map((i) => Product.fromJson(i))
          .toList();
    } catch (e) {
      throw Exception('Failed to parse products: $e');
    }

    return Section(
      section: json['section'],
      description: json['description'],
      products: productList,
    );
  }

  String getFormattedDescription() {
    if (description.endsWith('.')) {
      return description.substring(0, description.length - 1);
    }
    return description;
  }
}
