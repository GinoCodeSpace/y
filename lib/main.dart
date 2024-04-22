import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'common_libs.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const YApp());
}
