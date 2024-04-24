import '../../../common_libs.dart';

class UiConstants {
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color snowBall = Color(0xFFFFFBFF);
  static const Color blueJeansLight = Color(0xFFE5F6FF);
  static const Color jeanGrey = Color(0xFF79747E);
  static const Color blackStar = Color(0xFF1D1B20);
  static const Color deepblue = Color(0xFF04283B);
  static const Color greenLight = Color(0xFF7BBD1B);
  static const Color ocyan = Color(0xFF35A88E);
  static const Color greenDay = Color(0xFF007C61);
  static const Color greenDark = Color(0xFF007C61);
  static const Color guavaMusse = Color(0xFFEB797E);
  static var orangeLagrange = const Color(0xFFE65235);
  static const Color tomato = Color(0xFFED1C24);

  List<Color> get sectionsColors => [
        greenDay,
        tomato,
        ocyan,
        greenLight,
        greenDay,
        guavaMusse,
      ];

  static const double borderRadiusExtraExtraSmall = 4;
  static const double borderRadiusExtraSmall = 8;
  static const double borderRadiusSmall = 12;
  static const double borderRadiusMedium = 20;
  static const double borderRadiusLarge = 40;
  static const double borderRadiusExtraLarge = 50;

  static const double paddingExtraExtraSmall = 2;
  static const double paddingExtraSmall = 4;
  static const double paddingSmall = 8;
  static const double paddingMedium = 16;
  static const double paddingLarge = 24;
  static const double paddingExtraLarge = 32;
  static const double paddingExtraExtraLarge = 48;

  static const double desktopPadding = 96;

  static const double elevationNone = 0;
  static const double elevationMedium = 2.0;

  static const double letterSpaceExtraSmall = 0.10;
  static const double letterSpaceSmall = 0.25;
  static const double letterSpaceMedium = 0.50;

  static const String fontFamily = 'SF-pro-display';
  static const String fontFamilyIntelo = 'Intelo';

  static const double borderSideWidthMedium = 1.0;

  static const int doubleLine = 2;
}
