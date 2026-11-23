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
          // Banner Cinema no Topo
          SliverAppBar(
            expandedHeight: 185,
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
                    'CINEMELHADO',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 28,
                      letterSpacing: 3,
                      color: AppTheme.primary,
                    ),
                  ),
                  Text(
                    'VÍDEO LOCADORA & CINE CLUBE',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: AppTheme.secondary,
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
                        colors: [Color(0xFF0F0F14), Color(0xFF1E1418)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primary.withValues(alpha: 0.15),
                          border: Border.all(color: AppTheme.primary.withValues(alpha: 0.4)),
                        ),
                        child: const Icon(
                          Icons.local_movies_rounded,
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

          // Corpo da Tela
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badges de Destaque da Locadora
                  Row(
                    children: [
                      _buildCinemaStat(icon: Icons.movie, value: 'VHS & 4K', label: 'Mídias'),
                      const SizedBox(width: 10),
                      _buildCinemaStat(icon: Icons.star, value: '4.9 ★', label: 'Avaliação'),
                      const SizedBox(width: 10),
                      _buildCinemaStat(icon: Icons.fastfood, value: 'Pipoca', label: 'Grátis Sex/Sáb'),
                    ],
                  ),
                  const SizedBox(height: 26),

                  // Menu da Locadora
                  Text(
                    'SERVIÇOS & INFORMAÇÕES',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 18,
                      letterSpacing: 1.5,
                      color: AppTheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildNavTile(
                    icon: Icons.groups_outlined,
                    title: 'Curadoria & Equipe',
                    subtitle: 'Conheça Lucas Melhado e a equipe de cinéfilos da locadora',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EquipePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  _buildNavTile(
                    icon: Icons.rule_folder_outlined,
                    title: 'Regulamento de Locação',
                    subtitle: 'Prazos de devolução, diárias e promoções do Cine Clube',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ObjetivosPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  _buildNavTile(
                    icon: Icons.account_tree_outlined,
                    title: 'Arquitetura do Sistema',
                    subtitle: 'Diagramas de casos de uso e modelagem do acervo',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DiagramasPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 28),

                  // Seção Firestore (3º Trimestre)
                  Row(
                    children: [
                      Text(
                        'BASE DE DADOS FIRESTORE',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 18,
                          letterSpacing: 1.5,
                          color: AppTheme.primary,
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
                          'ONLINE',
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

                  // Card Entidade 1: Acervo de Filmes
                  _buildFirestoreFeatureCard(
                    title: 'Acervo de Filmes',
                    tag: 'ENTIDADE 1 (COLEÇÃO: FILME)',
                    desc: 'Consulte os títulos do catálogo em tempo real e adicione novas mídias e lançamentos.',
                    icon: Icons.video_library_outlined,
                    buttonLabel: 'ACESSAR ACERVO DE FILMES',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListaIntegrantePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Card Entidade 2: Locações
                  _buildFirestoreFeatureCard(
                    title: 'Quadro de Locações',
                    tag: 'ENTIDADE 2 (COLEÇÃO: LOCACAO)',
                    desc: 'Acompanhe os aluguéis de filmes retirados pelos clientes e registre novas locações.',
                    icon: Icons.receipt_long_outlined,
                    buttonLabel: 'ACESSAR QUADRO DE LOCAÇÕES',
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

  static Widget _buildCinemaStat({
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
          border: Border.all(color: const Color(0xFF2E2E3C)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.secondary, size: 20),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.bebasNeue(
                fontSize: 17,
                letterSpacing: 1,
                color: AppTheme.primaryText,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: AppTheme.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildNavTile({
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
          border: Border.all(color: const Color(0xFF2E2E3C)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.15),
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
                    style: GoogleFonts.montserrat(
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
        color: const Color(0xFF1B1B24),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
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
                child: Icon(icon, color: AppTheme.primary, size: 22),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryText,
                      ),
                    ),
                    Text(
                      tag,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 13,
                        color: AppTheme.secondary,
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
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: GoogleFonts.bebasNeue(
                  fontSize: 17,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
