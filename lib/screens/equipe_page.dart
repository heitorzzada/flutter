import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class EquipePage extends StatelessWidget {
  const EquipePage({super.key});

  Widget _buildArtistCard({
    required String name,
    required String role,
    required String description,
    required IconData icon,
  }) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
            child: Icon(icon, color: AppTheme.primary, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryText,
                  ),
                ),
                Text(
                  role,
                  style: GoogleFonts.oswald(
                    fontSize: 14,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 220,
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFF333340),
                    height: 16,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.secondaryText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        title: Text(
          'Artistas da Casa',
          style: GoogleFonts.cinzel(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.primary,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const Icon(
                Icons.groups,
                color: AppTheme.primary,
                size: 45,
              ),
              const SizedBox(height: 8),
              Text(
                'Nossa Equipe de Artistas',
                style: GoogleFonts.cinzel(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Conheça os profissionais e seus estilos de tatuagem autorais 🖤',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppTheme.secondaryText,
                ),
              ),
              const SizedBox(height: 24),

              // Artista 1: André Silva
              _buildArtistCard(
                name: 'André Silva',
                role: 'Tatuador Residente & Fundador',
                description: '• Especialista em Blackwork e Geométrico\n• 7 anos de experiência na arte da tatuagem\n• Criação de artes exclusivas sob medida',
                icon: Icons.brush,
              ),

              // Artista 2: Gabrielli Dolme
              _buildArtistCard(
                name: 'Gabrielli Dolme',
                role: 'Tatuadora Convidada',
                description: '• Especialista em Fineline e Microrealismo\n• Traços finos e florais delicados\n• Consultoria em cicatrização e cuidados',
                icon: Icons.auto_awesome,
              ),

              // Artista 3: Kauany Vieira
              _buildArtistCard(
                name: 'Kauany Vieira',
                role: 'Body Piercer & Estilo Tradicional',
                description: '• Aplicação de piercings com materiais de titânio\n• Tatuagens Old School e Tradicional Americano\n• Gerenciamento do estúdio e atendimento',
                icon: Icons.colorize,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
