import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class EquipePage extends StatelessWidget {
  const EquipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        title: Text(
          'CURADORIA & EQUIPE',
          style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 1.5),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge de Equipe
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.movie_filter, color: AppTheme.secondary, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'CURADORIA DO ACERVO CINEMELHADO',
                      style: GoogleFonts.bebasNeue(
                        color: AppTheme.secondary,
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Card Principal do Melhado
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Avatar Cinemático
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.primary, width: 2.5),
                        color: const Color(0xFF2E1A1A),
                      ),
                      child: Center(
                        child: Text(
                          'LM',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 38,
                            color: AppTheme.secondary,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    Text(
                      'Lucas Melhado',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryText,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      'Gerente de Curadoria & Desenvolvedor do Sistema',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppTheme.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Chips de Gêneros Favoritos
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildBadge('Ficção Científica'),
                        _buildBadge('Cinema Cult'),
                        _buildBadge('Anos 80 & 90'),
                        _buildBadge('Suspense Psicológico'),
                        _buildBadge('Desenvolvedor Flutter'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFF333344), thickness: 1),
                    const SizedBox(height: 14),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ATUAÇÃO NO PROJETO',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 16,
                          letterSpacing: 1.2,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildActivityItem(
                      icon: Icons.storage,
                      title: 'Banco Cloud Firestore',
                      desc: 'Modelagem das coleções de Filmes do acervo e Locações em tempo real.',
                    ),
                    const SizedBox(height: 12),
                    _buildActivityItem(
                      icon: Icons.movie_creation,
                      title: 'Catálogo & Curadoria de Títulos',
                      desc: 'Seleção dos clássicos, mídias em Bluray 4K e fitas VHS raras.',
                    ),
                    const SizedBox(height: 12),
                    _buildActivityItem(
                      icon: Icons.security,
                      title: 'Regras de Acesso & Validação',
                      desc: 'Garantia de regras no Firestore e validação dos formulários de aluguel.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Card de Contato da Locadora
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF333344)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: AppTheme.primary, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'CineMelhado Vídeo Locadora • Aberto de Seg a Sáb',
                        style: GoogleFonts.inter(
                          color: AppTheme.primaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A36),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3E3E4E)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: AppTheme.primaryText,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: AppTheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: AppTheme.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: GoogleFonts.inter(
                  color: AppTheme.secondaryText,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
