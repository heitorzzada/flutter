import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/tatuador.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';
import 'cadastro_integrante_page.dart';

class ListaIntegrantePage extends StatelessWidget {
  const ListaIntegrantePage({super.key});

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.primary, width: 1.5),
        ),
        title: Row(
          children: const [
            Icon(Icons.check_circle, color: AppTheme.primary, size: 28),
            SizedBox(width: 10),
            Text('Sucesso!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppTheme.primary)),
          ],
        ),
        content: const Text(
          'Cadastro realizado com sucesso!',
          style: TextStyle(fontSize: 16, color: AppTheme.primaryText),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tatuadores do Estúdio',
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
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Tatuador>>(
                stream: firestoreService.streamTatuadores(),
                builder: (context, snapshot) {
                  final tatuadores = snapshot.data ?? [];

                  // Se a lista estiver vazia, exibe imediatamente o estado vazio sem carregamento infinito
                  if (tatuadores.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.brush_outlined,
                            size: 64,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nenhum tatuador cadastrado ainda.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppTheme.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Toque no botão dourado abaixo para cadastrar.',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    itemCount: tatuadores.length,
                    itemBuilder: (context, index) {
                      final tatuador = tatuadores[index];
                      final dataStr = tatuador.criadoEm != null
                          ? DateFormat('dd/MM/yyyy HH:mm').format(tatuador.criadoEm!)
                          : null;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        color: AppTheme.secondaryBackground,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xFF2E2E38)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                                child: Text(
                                  tatuador.nome.isNotEmpty
                                      ? tatuador.nome[0].toUpperCase()
                                      : 'T',
                                  style: GoogleFonts.cinzel(
                                    color: AppTheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tatuador.nome,
                                      style: GoogleFonts.cinzel(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.style, size: 14, color: AppTheme.primary),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            'Estilo: ${tatuador.estilo}',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: AppTheme.secondaryText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        const Icon(Icons.star_border, size: 14, color: AppTheme.accent),
                                        const SizedBox(width: 5),
                                        Text(
                                          tatuador.experiencia,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            color: AppTheme.accent,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        if (dataStr != null) ...[
                                          const Spacer(),
                                          Text(
                                            dataStr,
                                            style: GoogleFonts.inter(
                                              fontSize: 11,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Botão Inferior de Cadastro
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final resultado = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroIntegrantePage(),
                      ),
                    );
                    if (resultado == true && context.mounted) {
                      _showSuccessPopup(context);
                    }
                  },
                  icon: const Icon(Icons.add, color: Colors.black, size: 24),
                  label: Text(
                    '+ Cadastrar Tatuador',
                    style: GoogleFonts.oswald(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
