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
          'Manual de Cicatrização',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner de Introdução
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF26221A), Color(0xFF1A1A22)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.verified, color: Colors.black, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PROTOCOLO ANDRÉ TATTOO',
                            style: GoogleFonts.cinzel(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '50% do resultado final da sua tatuagem depende dos seus cuidados na cicatrização.',
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
                'FASES DA CICATRIZAÇÃO',
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 14),

              // Fase 1
              _buildPhaseCard(
                phaseNumber: '01',
                period: 'PRIMEIRAS 48 HORAS',
                title: 'Proteção & Assepsia Inicial',
                icon: Icons.shield_outlined,
                steps: [
                  'Retire o filme plástico após 2 a 4 horas da sessão.',
                  'Lave com água corrente fria e sabonete neutro antibacteriano.',
                  'Seque dando toques leves com papel toalha descartável (nunca esfregue toalha de pano).',
                ],
              ),
              const SizedBox(height: 14),

              // Fase 2
              _buildPhaseCard(
                phaseNumber: '02',
                period: 'DO 3º AO 14º DIA',
                title: 'Cicatrização Ativa & Hidratação',
                icon: Icons.water_drop_outlined,
                steps: [
                  'Aplique a pomada cicatrizante recomendada em camada bem fina (3x ao dia).',
                  'A pele vai descascar naturalmente: JAMAIS puxe ou remova casquinhas.',
                  'Não coce a região tatuada; se coçar, dê leves tapinhas ao redor.',
                ],
              ),
              const SizedBox(height: 14),

              // Fase 3
              _buildPhaseCard(
                phaseNumber: '03',
                period: 'DO 15º DIA EM DIANTE',
                title: 'Fixação do Pigmento & Longevidade',
                icon: Icons.wb_sunny_outlined,
                steps: [
                  'Substitua a pomada por creme hidratante corporal diário.',
                  'Use protetor solar FPS 50+ sempre que for expor a tatuagem à luz solar.',
                  'Evite banhos de mar, piscina e sauna até a cicatrização completa (30 dias).',
                ],
              ),
              const SizedBox(height: 24),

              // Alerta de Proibições
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF241515),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.5)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: AppTheme.error, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ALERTA IMPORTANTE',
                            style: GoogleFonts.oswald(
                              color: AppTheme.error,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Evite consumir alimentos excessivamente gordurosos, frutos do mar e bebidas alcoólicas nas primeiras 48h para prevenir processos inflamatórios.',
                            style: GoogleFonts.inter(
                              color: const Color(0xFFE0C4C4),
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ],
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

  static Widget _buildPhaseCard({
    required String phaseNumber,
    required String period,
    required String title,
    required IconData icon,
    required List<String> steps,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2E2E38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  phaseNumber,
                  style: GoogleFonts.cinzel(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                period,
                style: GoogleFonts.oswald(
                  fontSize: 11,
                  letterSpacing: 1.2,
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(icon, color: AppTheme.primary, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.cinzel(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 10),
          ...steps.map(
            (step) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(color: AppTheme.primary, fontSize: 14)),
                  Expanded(
                    child: Text(
                      step,
                      style: GoogleFonts.inter(
                        fontSize: 12.5,
                        color: AppTheme.secondaryText,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
