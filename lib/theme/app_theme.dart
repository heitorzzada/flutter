import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de Cores Cinemática (CineMelhado Locadora)
  static const Color primary = Color(0xFFE50914); // Vermelho cinema / bilheteria
  static const Color primaryDark = Color(0xFF0F0F12); // Preto escuro fosco
  static const Color secondary = Color(0xFFFFC107); // Ouro pipoca / bilhete
  static const Color accent = Color(0xFFFF5252); // Vermelho vibrante
  static const Color primaryBackground = Color(0xFF141418); // Fundo escuro cinema
  static const Color secondaryBackground = Color(0xFF1F1F26); // Fundo dos cards
  static const Color surfaceColor = Color(0xFF282834); // Superfície elevada
  static const Color primaryText = Color(0xFFF8F9FA); // Branco puro
  static const Color secondaryText = Color(0xFFA5A5B5); // Cinza legenda
  static const Color alternate = Colors.white;
  static const Color error = Color(0xFFFF4D4D);
  static const Color success = Color(0xFF2ECC71);

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
        primary: primary,
        secondary: secondary,
        surface: primaryBackground,
        error: error,
      ),
      scaffoldBackgroundColor: primaryBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryDark,
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: false,
        titleTextStyle: GoogleFonts.bebasNeue(
          color: Colors.white,
          fontSize: 26,
          letterSpacing: 1.5,
        ),
      ),
      cardTheme: CardThemeData(
        color: secondaryBackground,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Color(0xFF2E2E3C)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: GoogleFonts.bebasNeue(
            fontSize: 18,
            letterSpacing: 1.2,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: secondaryBackground,
        labelStyle: GoogleFonts.inter(
          color: secondaryText,
          fontSize: 14,
        ),
        hintStyle: GoogleFonts.inter(
          color: secondaryText.withValues(alpha: 0.6),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF333344)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF333344)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
      ),
    );
  }
}
