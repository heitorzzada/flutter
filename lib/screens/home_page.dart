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
          // AppBar Customizada com Estilo de Ateliê de Tatuagem
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.primaryDark,
            elevation: 4,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ANDRÉ DE OLIVEIRA',
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppTheme.primary,
                    ),
                  ),
                  Text(
                    'TATTOO ATELIER & STUDIO',
                    style: GoogleFonts.oswald(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2.5,
                      color: AppTheme.secondaryText,
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
                        colors: [Color(0xFF0A0A0C), Color(0xFF1E1E26)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
                          color: AppTheme.primary.withValues(alpha: 0.08),
                        ),
                        child: const Icon(
                          Icons.colorize,
                          color: AppTheme.primary,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Conteúdo da Página
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Faixa de Informações Rápidas
                  Row(
                    children: [
                      _buildQuickStat(icon: Icons.star, value: '5.0', label: 'Avaliação'),
                      const SizedBox(width: 12),
                      _buildQuickStat(icon: Icons.shield, value: '100%', label: 'Biosseguro'),
                      const SizedBox(width: 12),
                      _buildQuickStat(icon: Icons.brush, value: 'Autoral', label: 'Blackwork'),
                    ],
                  ),
                  const SizedBox(height: 26),

                  // Seção 1: Painel Institucional
                  Text(
                    'CONHEÇA O ATELIER',
                    style: GoogleFonts.oswald(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Cards do Menu Institucional
                  _buildNavTile(
                    context: context,
                    icon: Icons.person_outline,
                    title: 'Sobre o Artista',
                    subtitle: 'Conheça André de Oliveira e seus estilos de traço',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EquipePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  _buildNavTile(
                    context: context,
                    icon: Icons.health_and_safety_outlined,
                    title: 'Manual de Cicatrização',
                    subtitle: 'Orientações pós-sessão para sua tattoo cicatrizar perfeita',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ObjetivosPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  _buildNavTile(
                    context: context,
                    icon: Icons.account_tree_outlined,
                    title: 'Arquitetura & Diagramas',
                    subtitle: 'Estrutura técnica do sistema e modelagem das entidades',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DiagramasPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 28),

                  // Seção 2: Banco de Dados Cloud Firestore (3º Trimestre)
                  Row(
                    children: [
                      Text(
                        'BASE DE DADOS FIRESTORE',
                        style: GoogleFonts.oswald(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'TEMPO REAL',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Card Entidade 1: Tatuadores
                  _buildFirestoreFeatureCard(
                    context: context,
                    title: 'Tatuadores do Estúdio',
                    tag: 'ENTIDADE 1',
                    desc: 'Acesse o catálogo de tatuadores registrados no Firestore e adicione novos membros à equipe.',
                    icon: Icons.brush,
                    buttonLabel: 'Ver Lista de Tatuadores',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListaIntegrantePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Card Entidade 2: Agendamentos
                  _buildFirestoreFeatureCard(
                    context: context,
                    title: 'Sessões & Agendamentos',
                    tag: 'ENTIDADE 2',
                    desc: 'Consulte os agendamentos de tatuagens marcadas em tempo real e crie novos agendamentos.',
                    icon: Icons.calendar_month,
                    buttonLabel: 'Ver Quadro de Agendamentos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListaAtividadePage()),
                      );
                    },
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

  static Widget _buildQuickStat({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: AppTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF282834)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.primary, size: 20),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.cinzel(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryText,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: AppTheme.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildNavTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2E2E38)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppTheme.primary, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.cinzel(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppTheme.secondaryText,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFirestoreFeatureCard({
    required BuildContext context,
    required String title,
    required String tag,
    required String desc,
    required IconData icon,
    required String buttonLabel,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppTheme.primary, size: 20),
              ),
              const SizedBox(width: 10),
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
                    Text(
                      tag,
                      style: GoogleFonts.oswald(
                        fontSize: 11,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppTheme.secondaryText,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: Text(buttonLabel),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: GoogleFonts.oswald(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
