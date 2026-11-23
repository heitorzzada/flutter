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
          'Sobre o Artista',
          style: GoogleFonts.cinzel(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primary,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.primary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge de Status
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
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'RESPONSÁVEL PELO PROJETO & ESTÚDIO',
                      style: GoogleFonts.oswald(
                        color: AppTheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Card Principal de André de Oliveira
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Avatar Estilizado
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.primary, width: 2.5),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2E2E38), Color(0xFF1A1A22)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'AO',
                              style: GoogleFonts.cinzel(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primary,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppTheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.brush, size: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Nome
                    Text(
                      'André de Oliveira',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cinzel(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryText,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Cargo / Função
                    Text(
                      'Tatuador Residente, Fundador & Desenvolvedor',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        fontSize: 15,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Chips de Especialidades
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildBadge('Blackwork'),
                        _buildBadge('Geométrico'),
                        _buildBadge('Fineline'),
                        _buildBadge('Pontilhismo'),
                        _buildBadge('Desenvolvedor Flutter'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFF333340), thickness: 1),
                    const SizedBox(height: 16),

                    // Biografia & Contribuições no Projeto
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SOBRE O DESENVOLVIMENTO',
                        style: GoogleFonts.oswald(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildContributionItem(
                      icon: Icons.architecture,
                      title: 'Arquitetura e Layout do App',
                      desc: 'Idealização visual, paleta dark/ouro e estruturação das telas.',
                    ),
                    const SizedBox(height: 12),
                    _buildContributionItem(
                      icon: Icons.storage,
                      title: 'Integração Cloud Firestore',
                      desc: 'Modelagem das coleções de Tatuadores e Agendamentos em tempo real.',
                    ),
                    const SizedBox(height: 12),
                    _buildContributionItem(
                      icon: Icons.security,
                      title: 'Regras de Segurança & Validações',
                      desc: 'Configuração de regras do Firestore e tratamento de campos obrigatórios.',
                    ),
                    const SizedBox(height: 12),
                    _buildContributionItem(
                      icon: Icons.palette_outlined,
                      title: 'Projetos Autorais de Tatuagem',
                      desc: 'Criação de identidade visual autoral e conceitos de tatuagem personalizada.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Card de Contato
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF333342)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.alternate_email, color: AppTheme.primary, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '@andre.oliveira.tattoo',
                        style: GoogleFonts.inter(
                          color: AppTheme.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'Curitiba - PR',
                      style: GoogleFonts.inter(
                        color: AppTheme.secondaryText,
                        fontSize: 13,
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
        color: const Color(0xFF282834),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3D3D4E)),
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

  static Widget _buildContributionItem({
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
            color: AppTheme.primary.withValues(alpha: 0.12),
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
                style: GoogleFonts.inter(
                  color: AppTheme.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
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
