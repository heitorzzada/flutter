import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ObjetivosPage extends StatelessWidget {
  const ObjetivosPage({super.key});

  Widget _buildHabitCard({
    required IconData icon,
    required String title,
    required String subtitle,
    double titleFontSize = 22,
  }) {
    return Container(
      width: 354,
      height: 82,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(11),
          topRight: Radius.circular(11),
          bottomRight: Radius.circular(11),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppTheme.accent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.mukta(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(
          'Objetivos',
          style: GoogleFonts.interTight(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Text(
                'Pequenas mudanças hoje,\ngrandes conquistas amanhã! 💜',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSansCondensed(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Objetivos gerais',
                style: GoogleFonts.oswald(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 16),

              // 1. Água
              _buildHabitCard(
                icon: Icons.water_drop,
                title: 'Beber mais água',
                subtitle: 'Mantenha-se hidratado todos os dias.',
                titleFontSize: 20,
              ),
              const SizedBox(height: 14),

              // 2. Exercícios
              _buildHabitCard(
                icon: Icons.directions_run_sharp,
                title: 'Praticar exercícios',
                subtitle: 'Mexa o corpo e cuide da saúde.',
                titleFontSize: 20,
              ),
              const SizedBox(height: 14),

              // 3. Alimentação
              _buildHabitCard(
                icon: Icons.restaurant_sharp,
                title: 'Alimentação saudável',
                subtitle: 'Escolhas equilibradas para mais energia.',
                titleFontSize: 19,
              ),
              const SizedBox(height: 14),

              // 4. Sono
              _buildHabitCard(
                icon: Icons.dark_mode_rounded,
                title: 'Dormir bem',
                subtitle: 'Uma boa noite de sono faz diferença.',
                titleFontSize: 20,
              ),
              const SizedBox(height: 14),

              // 5. Reduzir telas
              _buildHabitCard(
                icon: Icons.no_cell_rounded,
                title: 'Reduzir uso de telas',
                subtitle: 'Evite excesso de tempo no celular no dia a dia.',
                titleFontSize: 19,
              ),
              const SizedBox(height: 24),

              // Barra inferior decorativa
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
