import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_image.dart';

class DiagramasPage extends StatelessWidget {
  const DiagramasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(
          'Diagramas',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.bar_chart,
                color: Color(0xFF6F5ADB),
                size: 36,
              ),
              const SizedBox(height: 6),
              Text(
                'Diagramas:',
                style: GoogleFonts.oswald(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 16),

              // Diagrama 1: Caso de Uso
              Text(
                'Diagrama de Casos de Uso',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const CustomImage(
                assetPath: 'assets/images/ChatGPT_Image_4_de_mai._de_2026,_22_40_08.png',
                width: 340,
                height: 200,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                placeholderIcon: Icons.account_tree_outlined,
              ),
              const SizedBox(height: 8),
              Text(
                'Representa como o usuário interage com o aplicativo, podendo acessar as telas: inicial, equipe, objetivos e diagramas.',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: 15,
                  color: AppTheme.primaryText,
                  height: 1.3,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(thickness: 1.5, color: Color(0xFFEEEEEE)),
              ),

              // Diagrama 2: Diagrama de Classes
              Text(
                'Diagrama de Classes (Entidades)',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const CustomImage(
                assetPath: 'assets/images/ChatGPT_Image_4_de_mai._de_2026,_22_42_51.png',
                width: 340,
                height: 200,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                placeholderIcon: Icons.schema_outlined,
              ),
              const SizedBox(height: 8),
              Text(
                'Mostra a estrutura do sistema, com as classes das telas e as entidades (Integrante e Atividade) que são persistidas no Cloud Firestore.',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: 15,
                  color: AppTheme.primaryText,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 24),

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
