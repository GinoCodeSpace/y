import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../common_libs.dart';

class ApiService {
  String argument = '*';
  String original = 'true';
  String path =
      'https://gateway-smartforce-dev.devyandeh.com.br/process/candidates/search-products';

  Future<Catalog> fetchCatalog() async {
    Map<String, String> headers = {
      'token': '${dotenv.env['TOKEN']}',
      'Accept': '*/*',
      'Host': 'gateway-smartforce-dev.devyandeh.com.br',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    final response = await http.get(
      Uri.parse('$path?argument=$argument&original=$original'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return _handleSuccess(response);
    } else if (response.statusCode == 404) {
      return _handleNotFound(response);
    } else if (response.statusCode >= 500) {
      return _handleServerError(response);
    } else {
      return _handleOtherResponses(response);
    }
  }

  Catalog _handleSuccess(http.Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return Catalog.fromJson(json);
  }

  Catalog _handleNotFound(http.Response response) {
    throw Exception('Not found: ${response.body}');
  }

  Catalog _handleServerError(http.Response response) {
    throw Exception('Server error: ${response.body}');
  }

  Catalog _handleOtherResponses(http.Response response) {
    throw Exception('Unexpected response: ${response.body}');
  }
}
