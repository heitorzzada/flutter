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

  Widget _buildMenuButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color backgroundColor = AppTheme.secondaryBackground,
    Color borderColor = const Color(0xFF333340),
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 330,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: AppTheme.primary,
              size: 32,
            ),
            Text(
              title,
              textAlign: TextAlign.end,
              style: GoogleFonts.oswald(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: AppTheme.primaryText,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: AppTheme.primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: AppBar(
          backgroundColor: AppTheme.primaryDark,
          automaticallyImplyLeading: false,
          elevation: 4,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 14),
            centerTitle: true,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.colorize,
                  color: AppTheme.primary,
                  size: 42,
                ),
                const SizedBox(height: 4),
                Text(
                  'André Tattoo Studio',
                  style: GoogleFonts.cinzel(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: AppTheme.primary,
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
                  'BEM-VINDO AO ESTÚDIO',
                  style: GoogleFonts.oswald(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Arte na pele com técnica, precisão e estilo autêntico ✒️',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Card Iconográfico do Estúdio
                Container(
                  width: 330,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryBackground,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.primary.withValues(alpha: 0.4)),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E1E24), Color(0xFF141418)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shield_outlined, color: AppTheme.primary, size: 50),
                      const SizedBox(height: 8),
                      Text(
                        'TATTOO & PIERCING',
                        style: GoogleFonts.cinzel(
                          color: AppTheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '100% Materiais Descartáveis & Esterilizados',
                        style: GoogleFonts.inter(
                          color: AppTheme.secondaryText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 1. Tela Equipe (Tatuadores da Casa)
                _buildMenuButton(
                  context: context,
                  title: 'Tatuadores da Casa',
                  icon: Icons.groups_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EquipePage()),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // 2. Tela Cuidados pós-Tattoo
                _buildMenuButton(
                  context: context,
                  title: 'Cuidados com a Tattoo',
                  icon: Icons.verified_user_outlined,
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
                  title: 'Diagramas do Sistema',
                  icon: Icons.schema_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DiagramasPage()),
                    );
                  },
                ),
                const SizedBox(height: 22),

                // Divisor Visual para as Coleções Firestore
                Container(
                  width: 330,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: AppTheme.primary, thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'COLEÇÕES FIRESTORE',
                          style: GoogleFonts.cinzel(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primary,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: AppTheme.primary, thickness: 1)),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // 4. Lista da Entidade 1 (Tatuadores)
                _buildMenuButton(
                  context: context,
                  title: 'Lista de Tatuadores',
                  icon: Icons.brush_outlined,
                  borderColor: AppTheme.primary.withValues(alpha: 0.5),
                  backgroundColor: const Color(0xFF24221E),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListaIntegrantePage()),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // 5. Lista da Entidade 2 (Agendamentos)
                _buildMenuButton(
                  context: context,
                  title: 'Lista de Agendamentos',
                  icon: Icons.calendar_month_outlined,
                  borderColor: AppTheme.primary.withValues(alpha: 0.5),
                  backgroundColor: const Color(0xFF24221E),
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
