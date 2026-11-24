import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta Artesanal Horas Pães: Tons de trigo dourado, madeira tostada e manteiga cremosa
  static const Color primary = Color(0xFFE59838); // Âmbar Dourado / Crosta de Pão
  static const Color primaryDark = Color(0xFF120E0A); // Café Tostado Profundo
  static const Color secondary = Color(0xFFD96B43); // Terracota Quente / Canela
  static const Color accent = Color(0xFFFDE68A); // Manteiga / Creme de Trigo
  static const Color primaryBackground = Color(0xFF18130E); // Madeira Rústica Escura
  static const Color secondaryBackground = Color(0xFF241D17); // Forno / Card Rústico
  static const Color surfaceColor = Color(0xFF2E251E); // Superfície Elevada
  static const Color primaryText = Color(0xFFFFF9F2); // Creme Quente Acolhedor
  static const Color secondaryText = Color(0xFFBFAFA2); // Trigo Aveludado
  static const Color alternate = Colors.white;
  static const Color error = Color(0xFFFF5963);
  static const Color success = Color(0xFF48BB78); // Verde Erva Fresca

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
        foregroundColor: primary,
        elevation: 2,
        centerTitle: false,
        titleTextStyle: GoogleFonts.fraunces(
          color: primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
      cardTheme: CardThemeData(
        color: secondaryBackground,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF3B2F24)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: const Color(0xFF18130E),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: secondaryBackground,
        labelStyle: GoogleFonts.plusJakartaSans(
          color: secondaryText,
          fontSize: 14,
        ),
        hintStyle: GoogleFonts.plusJakartaSans(
          color: secondaryText.withValues(alpha: 0.6),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3B2F24)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF3B2F24)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
      ),
    );
  }
}
