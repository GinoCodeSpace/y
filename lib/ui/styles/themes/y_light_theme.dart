import '../../../common_libs.dart';

ThemeData yLightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    background: UiConstants.snowBall,
    onBackground: UiConstants.blackStar,
  ),
  fontFamily: 'SF-pro-display',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      fontFamily: 'SF-pro-display',
    ),
    displayMedium: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-pro-display',
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    titleMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-pro-display',
    ),
    titleSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'SF-pro-display',
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 0.07,
      fontFamily: 'SF-pro-display',
      color: UiConstants.blackStar,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-pro-display',
      fontStyle: FontStyle.normal,
      color: UiConstants.blackStar,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-pro-display',
      fontStyle: FontStyle.normal,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-pro-display',
      color: UiConstants.jeanGrey,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: UiConstants.pureWhite,
    centerTitle: true,
    toolbarHeight: 44,
    elevation: 2,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w200,
      fontFamily: 'SF-pro-display',
      color: UiConstants.blackStar,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: UiConstants.orangeLagrange,
  ),
);
