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
          'Tradição & Segredos da Massa',
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
                    colors: [Color(0xFF281C13), Color(0xFF1E1610)],
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
                      child: const Icon(Icons.grain, color: Color(0xFF18130E), size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MANIFESTO HORAS PÃES',
                            style: GoogleFonts.fraunces(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Respeito absoluto ao tempo da massa, à natureza dos ingredientes e à hora da fornada.',
                            style: GoogleFonts.plusJakartaSans(
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
                'OS 4 PILARES DA NOSSA PADARIA',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 14),

              // Pilar 1
              _buildPilarCard(
                numero: '01',
                periodo: 'FERMENTO NATURAL (LEVAIN)',
                titulo: 'Fermentação Longa de até 48 Horas',
                icone: Icons.eco_outlined,
                passos: [
                  'Sem fermentos químicos ou aditivos industriais: apenas farinha, água e micro-organismos vivos.',
                  'Quebra enzimática do glúten que proporciona uma digestão leve e sabor profundo levemente ácido.',
                  'Alvéolos abertos e casca dourada caramelizada naturalmente no forno.',
                ],
              ),
              const SizedBox(height: 14),

              // Pilar 2
              _buildPilarCard(
                numero: '02',
                periodo: 'O CONCEITO HORAS PÃES',
                titulo: 'Fornadas Pontuais a Cada Hora',
                icone: Icons.access_time,
                passos: [
                  'Planejamento cronometrado para que os clientes sempre encontrem pão quentinho.',
                  'Controle térmico de forno de lastro a 240°C com injeção precisa de vapor d\'água.',
                  'Notificação em tempo real de retirada para clientes que fizeram encomendas prévias.',
                ],
              ),
              const SizedBox(height: 14),

              // Pilar 3
              _buildPilarCard(
                numero: '03',
                periodo: 'INGREDIENTES SELECIONADOS',
                titulo: 'Farinhas Nobres & Manteiga Pura',
                icone: Icons.verified_outlined,
                passos: [
                  'Grãos nobres moídos em moinhos de pedra para preservar o gérmen e as fibras.',
                  'Manteiga de primeira linha sem gorduras hidrogenadas para os folhados e croissants.',
                  'Ovos caipiras frescos e frutas da estação para as receitas de confeitaria.',
                ],
              ),
              const SizedBox(height: 14),

              // Pilar 4
              _buildPilarCard(
                numero: '04',
                periodo: 'SUSTENTABILIDADE & COMUNIDADE',
                titulo: 'Desperdício Zero & Embalagens Ecológicas',
                icone: Icons.compost_outlined,
                passos: [
                  'Pães não vendidos no dia são transformados em farinhas de rosca artesanais e torradas gourmet.',
                  'Embalagens 100% de papel kraft biodegradável e celulose reciclável.',
                  'Parceria com cooperativas e produtores rurais locais.',
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPilarCard({
    required String numero,
    required String periodo,
    required String titulo,
    required IconData icone,
    required List<String> passos,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3B2F24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  numero,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF18130E),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  periodo,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              Icon(icone, color: AppTheme.primary, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            titulo,
            style: GoogleFonts.fraunces(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 12),
          ...passos.map((passo) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Icons.circle, size: 6, color: AppTheme.primary),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      passo,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: AppTheme.secondaryText,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
