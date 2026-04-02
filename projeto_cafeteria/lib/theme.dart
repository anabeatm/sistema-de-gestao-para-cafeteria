import 'package:flutter/material.dart';

class AppFonts {
  static const mainFont = 'IBM-PlexSans';

  static const TextStyle font = TextStyle(fontFamily: mainFont);
}

class FontSize {
  static const xp = 8.0;
  static const p = 12.0;
  static const md = 16.0;
  static const g = 20.0;
  static const xg = 24.0;
  static const xxg = 28.0;
}

class CoffeeColors {
  static const coffeeBrown = Color(0xFF3E2723);
  static const coffeeLight = Color(0xFF5D4037);
  static const coffeeDark = Color(0xFF1B0000);

  static const cream = Color(0xFFF5F0E6);
  static const warmCream = Color.fromARGB(255, 244, 235, 223);
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

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  fontFamily: AppFonts.mainFont,
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
);

ThemeData get darkTheme => ThemeData(
  useMaterial3: true,
  fontFamily: AppFonts.mainFont,
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
);
