import '../../common_libs.dart';
import '../components/custom_sliver_desktop_app_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildCustomSliverAppBar(context),
          _buildSliverBody(),
          _buildSections(),
        ],
      ),
    );
  }

  Widget _buildCustomSliverAppBar(BuildContext context) {
    bool isDesktop =
        LayoutUtils.isDesktopLarge(LayoutUtils.getDeviceWidth(context));
    if (isDesktop) {
      return const CustomSliverDesktopAppBar();
    }
    return const CustomSliverMobileAppBar();
  }

  SliverList _buildSliverBody() {
    return SliverList.list(
      children: const [
        HeroSection(),
      ],
    );
  }

  Widget _buildSections() {
    return const CustomSections();
  }
}


