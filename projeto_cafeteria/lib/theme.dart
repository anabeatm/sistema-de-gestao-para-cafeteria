import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
}

extension TextStyleContext on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension TextStyleExtensions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
}

class CoffeeColors {
  static const coffeeBrown = Color(0xFF3E2723);
  static const coffeeLight = Color(0xFF5D4037);
  static const coffeeDark = Color(0xFF1B0000);

  static const cream = Color(0xFFF5F0E6);
  static const beige = Color(0xFFE8DED1);
  static const caramel = Color(0xFFD4A574);

  static const mocha = Color(0xFF795548);
  static const espresso = Color(0xFF4E342E);
  static const latte = Color(0xFFBCAAA4);

  static const success = Color(0xFF2E7D32);
  static const warning = Color(0xFFE65100);
  static const error = Color(0xFFC62828);
  static const info = Color(0xFF0277BD);
}

class LightModeColors {
  static const lightPrimary = CoffeeColors.coffeeBrown;
  static const lightOnPrimary = Color(0xFFFFFFFF);
  static const lightPrimaryContainer = CoffeeColors.beige;
  static const lightOnPrimaryContainer = CoffeeColors.espresso;

  static const lightSecondary = CoffeeColors.caramel;
  static const lightOnSecondary = CoffeeColors.espresso;

  static const lightTertiary = CoffeeColors.mocha;
  static const lightOnTertiary = Color(0xFFFFFFFF);

  static const lightError = CoffeeColors.error;
  static const lightOnError = Color(0xFFFFFFFF);
  static const lightErrorContainer = Color(0xFFFFCDD2);
  static const lightOnErrorContainer = Color(0xFF7F1D1D);

  static const lightSurface = CoffeeColors.cream;
  static const lightOnSurface = CoffeeColors.coffeeBrown;
  static const lightBackground = CoffeeColors.cream;
  static const lightSurfaceVariant = CoffeeColors.beige;
  static const lightOnSurfaceVariant = CoffeeColors.coffeeLight;

  static const lightOutline = CoffeeColors.latte;
  static const lightShadow = Color(0xFF000000);
  static const lightInversePrimary = CoffeeColors.caramel;
}

class DarkModeColors {
  static const darkPrimary = CoffeeColors.caramel;
  static const darkOnPrimary = CoffeeColors.espresso;
  static const darkPrimaryContainer = CoffeeColors.coffeeLight;
  static const darkOnPrimaryContainer = CoffeeColors.cream;

  static const darkSecondary = CoffeeColors.latte;
  static const darkOnSecondary = CoffeeColors.espresso;

  static const darkTertiary = CoffeeColors.mocha;
  static const darkOnTertiary = Color(0xFFFFFFFF);

  static const darkError = Color(0xFFEF9A9A);
  static const darkOnError = CoffeeColors.error;
  static const darkErrorContainer = Color(0xFF7F1D1D);
  static const darkOnErrorContainer = Color(0xFFFFCDD2);

  static const darkSurface = CoffeeColors.espresso;
  static const darkOnSurface = CoffeeColors.cream;
  static const darkSurfaceVariant = CoffeeColors.coffeeLight;
  static const darkOnSurfaceVariant = CoffeeColors.beige;

  static const darkOutline = CoffeeColors.mocha;
  static const darkShadow = Color(0xFF000000);
  static const darkInversePrimary = CoffeeColors.coffeeBrown;
}

class FontSizes {
  static const double displayLarge = 52.0;
  static const double displayMedium = 42.0;
  static const double displaySmall = 34.0;
  static const double headlineLarge = 30.0;
  static const double headlineMedium = 26.0;
  static const double headlineSmall = 22.0;
  static const double titleLarge = 20.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;
  static const double labelLarge = 16.0;
  static const double labelMedium = 14.0;
  static const double labelSmall = 12.0;
  static const double bodyLarge = 18.0;
  static const double bodyMedium = 16.0;
  static const double bodySmall = 14.0;
}


ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: LightModeColors.lightPrimary,
    onPrimary: LightModeColors.lightOnPrimary,
    primaryContainer: LightModeColors.lightPrimaryContainer,
    onPrimaryContainer: LightModeColors.lightOnPrimaryContainer,
    secondary: LightModeColors.lightSecondary,
    onSecondary: LightModeColors.lightOnSecondary,
    tertiary: LightModeColors.lightTertiary,
    onTertiary: LightModeColors.lightOnTertiary,
    error: LightModeColors.lightError,
    onError: LightModeColors.lightOnError,
    errorContainer: LightModeColors.lightErrorContainer,
    onErrorContainer: LightModeColors.lightOnErrorContainer,
    surface: LightModeColors.lightSurface,
    onSurface: LightModeColors.lightOnSurface,
    surfaceContainerHighest: LightModeColors.lightSurfaceVariant,
    onSurfaceVariant: LightModeColors.lightOnSurfaceVariant,
    outline: LightModeColors.lightOutline,
    shadow: LightModeColors.lightShadow,
    inversePrimary: LightModeColors.lightInversePrimary,
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightModeColors.lightBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: CoffeeColors.cream,
    foregroundColor: LightModeColors.lightOnSurface,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.playfairDisplay(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: CoffeeColors.coffeeBrown,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 2,
    shadowColor: CoffeeColors.coffeeBrown.withValues(alpha: 0.15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
    color: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
      foregroundColor: Colors.white,
      backgroundColor: CoffeeColors.coffeeBrown,
      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
      foregroundColor: CoffeeColors.coffeeBrown,
      side: BorderSide(color: CoffeeColors.coffeeBrown, width: 1.5),
      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  iconTheme: const IconThemeData(color: CoffeeColors.coffeeBrown, size: 24),
  chipTheme: ChipThemeData(
    backgroundColor: CoffeeColors.beige,
    selectedColor: CoffeeColors.coffeeBrown,
    labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: CoffeeColors.latte),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: CoffeeColors.latte),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: CoffeeColors.coffeeBrown, width: 2),
    ),
    hintStyle: GoogleFonts.inter(color: CoffeeColors.latte, fontSize: 16),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: CoffeeColors.coffeeBrown,
    foregroundColor: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: CoffeeColors.coffeeBrown,
    unselectedItemColor: CoffeeColors.latte,
    elevation: 8,
  ),
  textTheme: _buildTextTheme(Brightness.light),
);

ThemeData get darkTheme => ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: DarkModeColors.darkPrimary,
    onPrimary: DarkModeColors.darkOnPrimary,
    primaryContainer: DarkModeColors.darkPrimaryContainer,
    onPrimaryContainer: DarkModeColors.darkOnPrimaryContainer,
    secondary: DarkModeColors.darkSecondary,
    onSecondary: DarkModeColors.darkOnSecondary,
    tertiary: DarkModeColors.darkTertiary,
    onTertiary: DarkModeColors.darkOnTertiary,
    error: DarkModeColors.darkError,
    onError: DarkModeColors.darkOnError,
    errorContainer: DarkModeColors.darkErrorContainer,
    onErrorContainer: DarkModeColors.darkOnErrorContainer,
    surface: DarkModeColors.darkSurface,
    onSurface: DarkModeColors.darkOnSurface,
    surfaceContainerHighest: DarkModeColors.darkSurfaceVariant,
    onSurfaceVariant: DarkModeColors.darkOnSurfaceVariant,
    outline: DarkModeColors.darkOutline,
    shadow: DarkModeColors.darkShadow,
    inversePrimary: DarkModeColors.darkInversePrimary,
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkModeColors.darkSurface,
  appBarTheme: AppBarTheme(
    backgroundColor: CoffeeColors.espresso,
    foregroundColor: DarkModeColors.darkOnSurface,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.playfairDisplay(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: CoffeeColors.cream,
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 2,
    shadowColor: Colors.black26,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
    color: CoffeeColors.coffeeLight,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
      foregroundColor: CoffeeColors.espresso,
      backgroundColor: CoffeeColors.caramel,
      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
      foregroundColor: CoffeeColors.caramel,
      side: BorderSide(color: CoffeeColors.caramel, width: 1.5),
      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  iconTheme: const IconThemeData(color: CoffeeColors.caramel, size: 24),
  chipTheme: ChipThemeData(
    backgroundColor: CoffeeColors.coffeeLight,
    selectedColor: CoffeeColors.caramel,
    labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: CoffeeColors.coffeeLight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: CoffeeColors.mocha),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: CoffeeColors.mocha),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: CoffeeColors.caramel, width: 2),
    ),
    hintStyle: GoogleFonts.inter(color: CoffeeColors.latte, fontSize: 16),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: CoffeeColors.caramel,
    foregroundColor: CoffeeColors.espresso,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.lg)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: CoffeeColors.espresso,
    selectedItemColor: CoffeeColors.caramel,
    unselectedItemColor: CoffeeColors.latte,
    elevation: 8,
  ),
  textTheme: _buildTextTheme(Brightness.dark),
);

TextTheme _buildTextTheme(Brightness brightness) {
  final textColor = brightness == Brightness.light
      ? CoffeeColors.coffeeBrown
      : CoffeeColors.cream;

  return TextTheme(
    displayLarge: GoogleFonts.playfairDisplay(
      fontSize: FontSizes.displayLarge,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      color: textColor,
    ),
    displayMedium: GoogleFonts.playfairDisplay(
      fontSize: FontSizes.displayMedium,
      fontWeight: FontWeight.w700,
      color: textColor,
    ),
    displaySmall: GoogleFonts.playfairDisplay(
      fontSize: FontSizes.displaySmall,
      fontWeight: FontWeight.w700,
      color: textColor,
    ),
    headlineLarge: GoogleFonts.playfairDisplay(
      fontSize: FontSizes.headlineLarge,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5,
      color: textColor,
    ),
    headlineMedium: GoogleFonts.playfairDisplay(
      fontSize: FontSizes.headlineMedium,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    headlineSmall: GoogleFonts.playfairDisplay(
      fontSize: FontSizes.headlineSmall,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: FontSizes.titleLarge,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: FontSizes.titleMedium,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: FontSizes.titleSmall,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSizes.labelLarge,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      color: textColor,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSizes.labelMedium,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: textColor,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSizes.labelSmall,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: textColor,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: FontSizes.bodyLarge,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: textColor,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: FontSizes.bodyMedium,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: textColor,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSizes.bodySmall,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: textColor,
    ),
  );
}
