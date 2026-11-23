import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/integrante.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';
import 'cadastro_integrante_page.dart';

class ListaIntegrantePage extends StatelessWidget {
  const ListaIntegrantePage({super.key});

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
          'Integrantes',
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
              child: StreamBuilder<List<Integrante>>(
                stream: firestoreService.streamIntegrantes(),
                builder: (context, snapshot) {
                  // Se houver dados, ou se a conexão estiver pronta ou com erro
                  final integrantes = snapshot.data ?? [];

                  // Se a lista estiver vazia, exibe imediatamente o estado vazio sem carregamento infinito
                  if (integrantes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.group_off_outlined,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nenhum integrante cadastrado ainda.',
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
                    itemCount: integrantes.length,
                    itemBuilder: (context, index) {
                      final integrante = integrantes[index];
                      final dataStr = integrante.criadoEm != null
                          ? DateFormat('dd/MM/yyyy HH:mm').format(integrante.criadoEm!)
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
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: AppTheme.primary.withValues(alpha: 0.12),
                                child: Text(
                                  integrante.nome.isNotEmpty
                                      ? integrante.nome[0].toUpperCase()
                                      : '?',
                                  style: GoogleFonts.inter(
                                    color: AppTheme.primary,
                                    fontSize: 18,
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
                                      integrante.nome,
                                      style: GoogleFonts.interTight(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.work_outline, size: 14, color: AppTheme.secondaryText),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            integrante.funcao,
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
                                        const Icon(Icons.school_outlined, size: 14, color: AppTheme.primary),
                                        const SizedBox(width: 4),
                                        Text(
                                          integrante.turma,
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppTheme.primary,
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

            // Barra inferior com o botão de cadastro (+ Cadastrar Integrante)
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
                  icon: const Icon(Icons.add, color: Colors.white, size: 24),
                  label: Text(
                    '+ Cadastrar integrante',
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
