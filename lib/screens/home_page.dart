import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'equipe_page.dart';
import 'objetivos_page.dart';
import 'diagramas_page.dart';
import 'lista_integrante_page.dart';
import 'lista_atividade_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      body: CustomScrollView(
        slivers: [
          // Header Acolhedor Horas Pães
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.primaryDark,
            elevation: 3,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'HORAS PÃES',
                    style: GoogleFonts.fraunces(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppTheme.primary,
                    ),
                  ),
                  Text(
                    'PADARIA & CONFEITARIA ARTESANAL',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.2,
                      color: AppTheme.accent,
                    ),
                  ),
                ],
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF140D08), Color(0xFF281C13)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 44),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.primary.withValues(alpha: 0.4), width: 1.5),
                          color: AppTheme.primary.withValues(alpha: 0.12),
                        ),
                        child: const Icon(
                          Icons.bakery_dining,
                          color: AppTheme.primary,
                          size: 38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Conteúdo Principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Destaques de Qualidade
                  Row(
                    children: [
                      _buildQuickStat(icon: Icons.timer, value: 'A Cada 1h', label: 'Pão Quente'),
                      const SizedBox(width: 10),
                      _buildQuickStat(icon: Icons.eco, value: '100%', label: 'Fermentação Natural'),
                      const SizedBox(width: 10),
                      _buildQuickStat(icon: Icons.favorite, value: 'Artesanal', label: 'Por Camila & Thaviny'),
                    ],
                  ),
                  const SizedBox(height: 26),

                  // Mensagem de Boas-Vindas
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF3B2F24)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.wb_sunny_outlined, color: AppTheme.primary, size: 26),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aroma inesquecível a cada hora',
                                style: GoogleFonts.fraunces(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryText,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Nossas fornadas saem frescas do forno de lastro para a sua mesa.',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  color: AppTheme.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),

                  // Seção: Gestão da Padaria
                  Text(
                    'CARDÁPIO & FORNADAS',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildNavTile(
                    context: context,
                    icon: Icons.breakfast_dining,
                    title: 'Cardápio de Pães & Doces',
                    subtitle: 'Acervo de pães de fermentação natural, croissants e doces',
                    accentColor: AppTheme.primary,
                    page: const ListaIntegrantePage(),
                  ),
                  const SizedBox(height: 12),

                  _buildNavTile(
                    context: context,
                    icon: Icons.access_time_filled,
                    title: 'Horas de Fornadas & Encomendas',
                    subtitle: 'Acompanhe horários de saída de pão quente e pedidos',
                    accentColor: AppTheme.secondary,
                    page: const ListaAtividadePage(),
                  ),
                  const SizedBox(height: 26),

                  // Seção: Institucional
                  Text(
                    'CONHEÇA A HORAS PÃES',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildNavTile(
                    context: context,
                    icon: Icons.people_alt_outlined,
                    title: 'Mestres Padeiras (Camila & Thaviny)',
                    subtitle: 'Conheça as idealizadoras e fundadoras da padaria',
                    accentColor: const Color(0xFFFDE68A),
                    page: const EquipePage(),
                  ),
                  const SizedBox(height: 12),

                  _buildNavTile(
                    context: context,
                    icon: Icons.grain,
                    title: 'Tradição & Segredos da Massa',
                    subtitle: 'Pilares de qualidade, maturação lenta e fermento Levain',
                    accentColor: const Color(0xFF48BB78),
                    page: const ObjetivosPage(),
                  ),
                  const SizedBox(height: 12),

                  _buildNavTile(
                    context: context,
                    icon: Icons.account_tree_outlined,
                    title: 'Engenharia & Diagramas do Sistema',
                    subtitle: 'Modelagem técnica e arquitetura de software da padaria',
                    accentColor: const Color(0xFF63B3ED),
                    page: const DiagramasPage(),
                  ),
                  const SizedBox(height: 28),

                  // Especiais do Forno
                  Text(
                    'ESPECIAIS DO DIA',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildEspecialCard(
                    title: 'Sourdough Rústico Tradicional',
                    desc: 'Fermentação selvagem de 48h, casca crocante e miolo super aerado.',
                    preco: 'R\$ 19,00',
                    tag: 'Mais Pedido',
                  ),
                  const SizedBox(height: 10),
                  _buildEspecialCard(
                    title: 'Croissant Francês de Manteiga',
                    desc: '27 camadas de massa folhada com manteiga da melhor qualidade.',
                    preco: 'R\$ 14,50',
                    tag: 'Fornada das 08h e 16h',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStat({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: AppTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF3B2F24)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.primary, size: 22),
            const SizedBox(height: 6),
            Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.fraunces(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryText,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10,
                color: AppTheme.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color accentColor,
    required Widget page,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.secondaryBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF3B2F24)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accentColor.withValues(alpha: 0.3)),
                ),
                child: Icon(icon, color: accentColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.fraunces(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryText,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: AppTheme.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: AppTheme.primary, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEspecialCard({
    required String title,
    required String desc,
    required String preco,
    required String tag,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.bakery_dining, color: AppTheme.primary, size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.fraunces(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryText,
                        ),
                      ),
                    ),
                    Text(
                      preco,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: AppTheme.secondaryText,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
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
