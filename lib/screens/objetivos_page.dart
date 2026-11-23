import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ObjetivosPage extends StatelessWidget {
  const ObjetivosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        title: Text(
          'REGULAMENTO DE LOCAÇÃO',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner do Clube de Cinema
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF261214), Color(0xFF1B1B26)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.4)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.confirmation_num, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'REGRAS DO CINE CLUBE',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              letterSpacing: 1.2,
                              color: AppTheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Mantenha suas locações em dia e ganhe descontos e pipoca grátis nos fins de semana!',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.secondaryText,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'DIRETRIZES DA LOCADORA',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  letterSpacing: 1.5,
                  color: AppTheme.secondary,
                ),
              ),
              const SizedBox(height: 14),

              _buildRuleCard(
                number: '01',
                title: 'Prazos de Devolução',
                desc: 'Filmes Lançamento possuem prazo de devolução de 24 horas. Filmes do Acervo Clássico possuem prazo de até 3 dias úteis.',
                icon: Icons.access_time_filled,
              ),
              const SizedBox(height: 12),

              _buildRuleCard(
                number: '02',
                title: 'Conservação das Mídias (VHS & Bluray)',
                desc: 'Guarde as mídias sempre em suas caixas originais. No caso de fitas VHS, devolver rebobinada para evitar taxas de rebobinamento.',
                icon: Icons.album,
              ),
              const SizedBox(height: 12),

              _buildRuleCard(
                number: '03',
                title: 'Promoção Quarta-Feira em Dobro',
                desc: 'Todas as quartas-feiras, ao alugar 2 filmes do catálogo, o 3º filme sai totalmente gratuito.',
                icon: Icons.celebration_outlined,
              ),
              const SizedBox(height: 12),

              _buildRuleCard(
                number: '04',
                title: 'Reservas Antecipadas',
                desc: 'Clientes sócios podem solicitar a reserva de grandes lançamentos através do aplicativo com até 48h de antecedência.',
                icon: Icons.bookmark_add_outlined,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildRuleCard({
    required String number,
    required String title,
    required String desc,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2E2E3C)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              number,
              style: GoogleFonts.bebasNeue(
                fontSize: 16,
                color: AppTheme.primary,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryText,
                        ),
                      ),
                    ),
                    Icon(icon, color: AppTheme.secondary, size: 18),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: GoogleFonts.inter(
                    fontSize: 12.5,
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
}
