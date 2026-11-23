import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de Cores Premium para Estúdio de Tatuagem (Dark / Ouro / Carmesim)
  static const Color primary = Color(0xFFD4AF37); // Ouro envelhecido metálico
  static const Color primaryDark = Color(0xFF141416); // Preto carbono
  static const Color secondary = Color(0xFFA31D1D); // Carmesim tinta
  static const Color accent = Color(0xFFE5C158); // Ouro claro
  static const Color primaryBackground = Color(0xFF121214); // Fundo escuro fosco
  static const Color secondaryBackground = Color(0xFF1E1E24); // Fundo dos cards escuro
  static const Color surfaceColor = Color(0xFF282830); // Superfície elevada
  static const Color primaryText = Color(0xFFF5F5F7); // Branco leve
  static const Color secondaryText = Color(0xFFA8A8B4); // Cinza médio
  static const Color alternate = Colors.white;
  static const Color error = Color(0xFFFF5963);
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
        foregroundColor: primary,
        elevation: 3,
        centerTitle: false,
        titleTextStyle: GoogleFonts.cinzel(
          color: primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: secondaryBackground,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF2E2E38)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: GoogleFonts.oswald(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
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
          borderSide: const BorderSide(color: Color(0xFF333340)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF333340)),
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
