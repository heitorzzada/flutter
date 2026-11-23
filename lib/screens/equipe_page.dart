import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_image.dart';

class EquipePage extends StatelessWidget {
  const EquipePage({super.key});

  Widget _buildMemberCard({
    required BuildContext context,
    required String name,
    required String tasks,
    required String imagePath,
  }) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 355,
        constraints: const BoxConstraints(minHeight: 180),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: Color(0xFF303090),
                  size: 24,
                ),
                const SizedBox(height: 8),
                CustomImage(
                  assetPath: imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(8),
                  placeholderIcon: Icons.person_outline,
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.oswald(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      thickness: 2,
                      color: Color(0xFF303090),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tasks,
                    style: GoogleFonts.oswald(
                      fontSize: 14,
                      color: AppTheme.primaryText,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
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
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(
          'Equipe',
          style: GoogleFonts.openSansCondensed(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const Icon(
                Icons.groups,
                color: Color(0xFF551EBB),
                size: 45,
              ),
              const SizedBox(height: 8),
              Text(
                'Nossa equipe',
                style: GoogleFonts.oswald(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Conheça os integrantes do projeto e suas contribuições. 💜',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  letterSpacing: 1.5,
                  color: AppTheme.secondaryText,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // Integrante 1: Kauany Vieira
              _buildMemberCard(
                context: context,
                name: 'Kauany Vieira',
                tasks: '• Desenvolvimento da tela inicial\n• Organização do layout no FlutterFlow\n• Definição do design do aplicativo',
                imagePath: 'assets/images/Gemini_Generated_Image_ani28sani28sani2.png',
              ),
              const SizedBox(height: 20),

              // Integrante 2: Gabrielli Dolme
              _buildMemberCard(
                context: context,
                name: 'Gabrielli Dolme',
                tasks: '• Criação da tela de objetivos\n• Organização dos componentes\n• Estruturação das demais telas do aplicativo',
                imagePath: 'assets/images/ChatGPT_Image_4_de_mai._de_2026,_18_39_00.png',
              ),
              const SizedBox(height: 32),

              // Barra inferior decorativa
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
