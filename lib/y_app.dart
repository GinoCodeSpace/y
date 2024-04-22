import 'common_libs.dart';

class YApp extends StatelessWidget {
  const YApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'yandeh';
    return MaterialApp(
      title: appTitle,
      theme: yLightTheme,
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
