import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/atividade.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';
import 'cadastro_atividade_page.dart';

class ListaAtividadePage extends StatelessWidget {
  const ListaAtividadePage({super.key});

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.check_circle, color: AppTheme.success, size: 28),
            SizedBox(width: 10),
            Text('Sucesso!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppTheme.primaryText)),
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
              foregroundColor: Colors.white,
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
          'Atividades',
          style: GoogleFonts.interTight(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Atividade>>(
                stream: firestoreService.streamAtividades(),
                builder: (context, snapshot) {
                  final atividades = snapshot.data ?? [];

                  // Se a lista estiver vazia, exibe imediatamente o estado vazio sem carregamento infinito
                  if (atividades.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_run_outlined,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nenhuma atividade cadastrada ainda.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppTheme.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Clique no botão abaixo para adicionar.',
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemCount: atividades.length,
                    itemBuilder: (context, index) {
                      final atividade = atividades[index];
                      final dataStr = atividade.criadoEm != null
                          ? DateFormat('dd/MM/yyyy HH:mm').format(atividade.criadoEm!)
                          : null;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        color: Colors.white,
                        elevation: 1.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9974CC).withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.fitness_center,
                                  color: AppTheme.primary,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      atividade.titulo,
                                      style: GoogleFonts.interTight(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      atividade.descricao,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: AppTheme.secondaryText,
                                        height: 1.3,
                                      ),
                                    ),
                                    if (dataStr != null) ...[
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 13,
                                            color: Colors.grey.shade500,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            dataStr,
                                            style: GoogleFonts.inter(
                                              fontSize: 11,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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

            // Barra inferior com o botão de cadastro (+ Cadastrar Atividade)
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
                        builder: (context) => const CadastroAtividadePage(),
                      ),
                    );
                    if (resultado == true && context.mounted) {
                      _showSuccessPopup(context);
                    }
                  },
                  icon: const Icon(Icons.add, color: Colors.white, size: 24),
                  label: Text(
                    '+ Cadastrar atividade',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
