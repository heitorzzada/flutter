import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ObjetivosPage extends StatelessWidget {
  const ObjetivosPage({super.key});

  Widget _buildCareCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2E2E38)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
            ),
            child: Icon(
              icon,
              color: AppTheme.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.cinzel(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.secondaryText,
                    height: 1.3,
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
          'Cuidados com a Tattoo',
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            children: [
              Text(
                'Guia de Cicatrização Perfeita ⚡',
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzel(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Siga as orientações para manter suas cores vivas e o traço impecável.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppTheme.secondaryText,
                ),
              ),
              const SizedBox(height: 20),

              _buildCareCard(
                icon: Icons.cleaning_services_outlined,
                title: '1. Higiene com Sabonete Neutro',
                subtitle: 'Lave suavemente 3 vezes ao dia com água fria e sabonete antibacteriano.',
              ),
              _buildCareCard(
                icon: Icons.water_drop_outlined,
                title: '2. Hidratação Constante',
                subtitle: 'Aplique camada fina de pomada cicatrizante recomendada pelo tatuador.',
              ),
              _buildCareCard(
                icon: Icons.wb_sunny_outlined,
                title: '3. Evitar Sol Direto & Praia',
                subtitle: 'Não tome sol, evite piscina e água do mar nos primeiros 20 dias.',
              ),
              _buildCareCard(
                icon: Icons.do_not_touch_outlined,
                title: '4. Não Coçar nem Arrancar Casquinhas',
                subtitle: 'A casquinha protege o pigmento; arrancá-la pode falhar o traço da tattoo.',
              ),
              _buildCareCard(
                icon: Icons.restaurant_outlined,
                title: '5. Alimentação Balanceada',
                subtitle: 'Evite alimentos muito gordurosos como carne de porco e frutos do mar na primeira semana.',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
