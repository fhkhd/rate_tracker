import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    this.primaryColor = const Color(0xFF86A7EA),
    this.tertiaryColor = const Color(0xFFF1BD88),
    this.neutralColor = const Color(0xFF191925),
  });

  final Color primaryColor;
  final Color tertiaryColor;
  final Color neutralColor;

  Scheme _scheme() {
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;
    return Scheme(
      primary: primary.get(80),
      onPrimary: primary.get(20),
      primaryContainer: primary.get(30),
      onPrimaryContainer: primary.get(90),
      secondary: base.secondary.get(80),
      onSecondary: base.secondary.get(20),
      secondaryContainer: base.secondary.get(30),
      onSecondaryContainer: base.secondary.get(90),
      tertiary: tertiary.get(80),
      onTertiary: tertiary.get(20),
      tertiaryContainer: tertiary.get(30),
      onTertiaryContainer: tertiary.get(90),
      error: base.error.get(80),
      onError: base.error.get(20),
      errorContainer: base.error.get(30),
      onErrorContainer: base.error.get(90),
      background: neutral.get(10),
      onBackground: neutral.get(80),
      surface: neutral.get(10),
      onSurface: neutral.get(90),
      outline: base.neutralVariant.get(60),
      outlineVariant: base.neutralVariant.get(30),
      surfaceVariant: base.neutralVariant.get(30),
      onSurfaceVariant: base.neutralVariant.get(80),
      shadow: neutral.get(0),
      scrim: neutral.get(0),
      inverseSurface: neutral.get(90),
      inverseOnSurface: neutral.get(20),
      inversePrimary: primary.get(40),
    );
  }

  ThemeData _base(final ColorScheme colorScheme) {
    final primaryTextTheme = GoogleFonts.interTextTheme();
    final secondaryTextTheme = GoogleFonts.montserratTextTheme();

    final textTheme = primaryTextTheme.copyWith(
      displaySmall: secondaryTextTheme.displaySmall
          ?.copyWith(color: colorScheme.onBackground),
      displayMedium: secondaryTextTheme.displayMedium
          ?.copyWith(color: colorScheme.onBackground),
      displayLarge: secondaryTextTheme.displayLarge
          ?.copyWith(color: colorScheme.onBackground),
      headlineSmall: secondaryTextTheme.headlineSmall
          ?.copyWith(color: colorScheme.onBackground),
      headlineMedium: secondaryTextTheme.headlineMedium
          ?.copyWith(color: colorScheme.onBackground),
      headlineLarge: secondaryTextTheme.headlineLarge
          ?.copyWith(color: colorScheme.onBackground),
      bodySmall:
          primaryTextTheme.bodySmall?.copyWith(color: colorScheme.onBackground),
      bodyMedium: primaryTextTheme.bodyMedium
          ?.copyWith(color: colorScheme.onBackground),
      bodyLarge:
          primaryTextTheme.bodyLarge?.copyWith(color: colorScheme.onBackground),
      labelSmall: primaryTextTheme.labelSmall
          ?.copyWith(color: colorScheme.onBackground),
      labelMedium: primaryTextTheme.labelMedium
          ?.copyWith(color: colorScheme.onBackground),
      labelLarge: primaryTextTheme.labelLarge
          ?.copyWith(color: colorScheme.onBackground),
      titleSmall: primaryTextTheme.titleSmall
          ?.copyWith(color: colorScheme.onBackground),
      titleMedium: primaryTextTheme.titleMedium
          ?.copyWith(color: colorScheme.onBackground),
      titleLarge: primaryTextTheme.titleLarge
          ?.copyWith(color: colorScheme.onBackground),
    );

    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: textTheme,
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.onSurface,
        unselectedLabelColor: colorScheme.onSurface,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorScheme.primary, width: 2),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colorScheme.surface,
        selectedIconTheme:
            IconThemeData(color: colorScheme.onSecondaryContainer),
        indicatorColor: colorScheme.secondaryContainer,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface,
      ),
    );
  }

  ThemeData toThemeData() {
    final colorScheme = _scheme().toColorScheme(Brightness.dark);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      AppTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  AppTheme lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) return this;
    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}

extension on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      primaryContainer: Color(primaryContainer),
      onPrimaryContainer: Color(onPrimaryContainer),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      secondaryContainer: Color(secondaryContainer),
      onSecondaryContainer: Color(onSecondaryContainer),
      tertiary: Color(tertiary),
      onTertiary: Color(onTertiary),
      tertiaryContainer: Color(tertiaryContainer),
      onTertiaryContainer: Color(onTertiaryContainer),
      error: Color(error),
      onError: Color(onError),
      errorContainer: Color(errorContainer),
      onErrorContainer: Color(onErrorContainer),
      outline: Color(outline),
      outlineVariant: Color(outlineVariant),
      background: Color(background),
      onBackground: Color(onBackground),
      surface: Color(surface),
      onSurface: Color(onSurface),
      surfaceVariant: Color(surfaceVariant),
      onSurfaceVariant: Color(onSurfaceVariant),
      inverseSurface: Color(inverseSurface),
      onInverseSurface: Color(inverseOnSurface),
      inversePrimary: Color(inversePrimary),
      shadow: Color(shadow),
      scrim: Color(scrim),
      surfaceTint: Color(primary),
      brightness: brightness,
    );
  }
}
