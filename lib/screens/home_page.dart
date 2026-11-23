import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_image.dart';
import 'equipe_page.dart';
import 'objetivos_page.dart';
import 'diagramas_page.dart';
import 'lista_integrante_page.dart';
import 'lista_atividade_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildMenuButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color backgroundColor = AppTheme.primary,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(11),
      child: Container(
        width: 320,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: AppTheme.alternate,
              size: 36,
            ),
            Text(
              title,
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: AppTheme.alternate,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: AppTheme.alternate,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(112),
        child: AppBar(
          backgroundColor: AppTheme.primary,
          automaticallyImplyLeading: false,
          elevation: 2,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 14),
            centerTitle: true,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 44,
                ),
                const SizedBox(height: 4),
                Text(
                  'Vida Saudável',
                  style: GoogleFonts.openSansCondensed(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFFF4F7F9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Bem-vindo!',
                  style: GoogleFonts.oswald(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cuide da sua saúde física e mental ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppTheme.secondaryText,
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: AppTheme.primary,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Imagem de destaque com fallback seguro
                const CustomImage(
                  assetPath: 'assets/images/WhatsApp_Image_2026-05-04_at_5.45.32_PM.jpeg',
                  width: 250,
                  height: 180,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  placeholderIcon: Icons.spa_outlined,
                ),
                const SizedBox(height: 24),

                // 1. Tela Equipe
                _buildMenuButton(
                  context: context,
                  title: 'Equipe',
                  icon: Icons.groups,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EquipePage()),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // 2. Tela Objetivos
                _buildMenuButton(
                  context: context,
                  title: 'Objetivos',
                  icon: Icons.track_changes_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ObjetivosPage()),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // 3. Tela Diagramas
                _buildMenuButton(
                  context: context,
                  title: 'Diagramas',
                  icon: Icons.bar_chart_sharp,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DiagramasPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Separador visual para as novas entidades do 3º trimestre
                Container(
                  width: 320,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: AppTheme.primary, thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'COLEÇÕES FIRESTORE',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primary,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: AppTheme.primary, thickness: 1)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // 4. Lista da Entidade 1 (Integrantes)
                _buildMenuButton(
                  context: context,
                  title: 'Lista de integrantes',
                  icon: Icons.badge_outlined,
                  backgroundColor: AppTheme.secondary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListaIntegrantePage()),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // 5. Lista da Entidade 2 (Atividades)
                _buildMenuButton(
                  context: context,
                  title: 'Lista de atividades',
                  icon: Icons.checklist_rounded,
                  backgroundColor: AppTheme.secondary,
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
      ),
    );
  }
}
