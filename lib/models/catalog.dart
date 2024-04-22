import '../common_libs.dart';

class Catalog {
  List<Section> sections;

  Catalog({
    required this.sections,
  });

  @override
  String toString() {
    return 'Catalog{sections: $sections}';
  }

  factory Catalog.fromJson(Map<String, dynamic> json) {
    if (json['sections'] == null) {
      throw Exception('Missing "sections" field in JSON data');
    }

    List<Section> sectionList;
    try {
      sectionList = (json['sections'] as List<dynamic>)
          .map((i) => Section.fromJson(i))
          .toList();
    } catch (e) {
      throw Exception('Failed to parse sections: $e');
    }

    return Catalog(
      sections: sectionList,
    );
  }
}
