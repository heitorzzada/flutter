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
          'Mestres Padeiras',
          style: GoogleFonts.fraunces(
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
              // Badge de Status da Equipe
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
                      'AUTORAS & FUNDADORAS DO PROJETO',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppTheme.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // CARD 1: CAMILA
              _buildMemberCard(
                nome: 'Camila',
                subtitulo: '(Camila & Thaviny)',
                cargo: 'Mestre Padeira & Confeiteira Chefe',
                iniciais: 'CA',
                corDestaque: AppTheme.primary,
                icone: Icons.bakery_dining,
                bio: 'Especialista em fermentação selvagem lenta (Levain) com maturação de 48h, hidratação de massas artesanais e viennoiserie tradicional francesa. Apaixonada pela ciência da panificação clássica e criação de sabores exclusivos para a Horas Pães.',
                habilidades: ['Fermento Natural (Levain)', 'Viennoiserie & Croissant', 'Confeitaria Fina', 'Autólise & Hidratação'],
              ),
              const SizedBox(height: 20),

              // CARD 2: THAVINY
              _buildMemberCard(
                nome: 'Thaviny',
                subtitulo: '(Camila & Thaviny)',
                cargo: 'Gestora de Operações & Mestre de Fornadas',
                iniciais: 'TH',
                corDestaque: AppTheme.secondary,
                icone: Icons.timer,
                bio: 'Responsável pelo gerenciamento rigoroso do tempo de fornada, seleção de farinhas puras de moinhos parceiros, sustentabilidade de insumos e atendimento acolhedor aos clientes e apreciadores de pão quente.',
                habilidades: ['Controle de Fornadas Horárias', 'Gestão de Ingredientes Nobres', 'Controle de Qualidade', 'Experiência do Cliente'],
              ),
              const SizedBox(height: 24),

              // Card da Parceria e Missão
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF3B2F24)),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.favorite, color: AppTheme.primary, size: 28),
                    const SizedBox(height: 10),
                    Text(
                      'A Sinergia Horas Pães',
                      style: GoogleFonts.fraunces(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryText,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'O projeto Horas Pães une a precisão técnica das receitas de Camila à excelência operacional de Thaviny, trazendo o melhor pão artesanal em horários precisos para a comunidade.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: AppTheme.secondaryText,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required String nome,
    required String subtitulo,
    required String cargo,
    required String iniciais,
    required Color corDestaque,
    required IconData icone,
    required String bio,
    required List<String> habilidades,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: corDestaque.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 5),
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
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: corDestaque, width: 2.5),
                  gradient: LinearGradient(
                    colors: [const Color(0xFF2E241D), const Color(0xFF18130E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    iniciais,
                    style: GoogleFonts.fraunces(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: corDestaque,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: corDestaque,
                  shape: BoxShape.circle,
                ),
                child: Icon(icone, size: 16, color: const Color(0xFF18130E)),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(
            nome,
            style: GoogleFonts.fraunces(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            cargo,
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: corDestaque,
            ),
          ),
          const SizedBox(height: 14),

          Text(
            bio,
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: AppTheme.secondaryText,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),

          // Chips de Habilidades
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: habilidades.map((habilidade) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: corDestaque.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: corDestaque.withValues(alpha: 0.25)),
                ),
                child: Text(
                  habilidade,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryText,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
