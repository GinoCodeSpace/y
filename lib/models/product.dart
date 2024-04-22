class Product {
  int id;
  String name;
  String sku;
  String category;
  String? unitType;
  String package;
  String ean;
  int unitContent;
  String unitMessure;
  int packageQuantity;
  String price;

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    this.unitType,
    required this.package,
    required this.ean,
    required this.unitContent,
    required this.unitMessure,
    required this.packageQuantity,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null ||
        json['name'] == null ||
        json['sku'] == null ||
        json['category'] == null ||
        json['package'] == null ||
        json['ean'] == null ||
        json['unitContent'] == null ||
        json['unitMessure'] == null ||
        json['packageQuantity'] == null ||
        json['price'] == null) {
      throw Exception('Missing mandatory fields in JSON data');
    }

    return Product(
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      category: json['category'],
      unitType: json['unitType'] as String?, // Cast as nullable String
      package: json['package'],
      ean: json['ean'],
      unitContent: (json['unitContent'] is int)
          ? json['unitContent']
          : (json['unitContent'] as double).toInt(),
      unitMessure: json['unitMessure'],
      packageQuantity: (json['packageQuantity'] is int)
          ? json['packageQuantity']
          : (json['packageQuantity'] as double).toInt(),
      price: json['price'],
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, sku: $sku, category: $category, unitType: $unitType, package: $package, ean: $ean, unitContent: $unitContent, unitMessure: $unitMessure, packageQuantity: $packageQuantity, price: $price}';
  }

  String currentPrefixValue = 'R\$';

  String get formattedPrice {
    final priceValue = double.parse(price);
    return '$currentPrefixValue ${priceValue.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  String get formattedUnitContent {
    if (unitContent > 0) {
      return '$unitContent $unitMessure';
    }
    return 'Unidade';
  }
}

extension StringExtension on String {
  String toTitleCase() {
    if (isEmpty) return this;
    return toLowerCase()
        .split(' ')
        .map((str) =>
            str.isNotEmpty ? str[0].toUpperCase() + str.substring(1) : str)
        .join(' ');
  }
}
