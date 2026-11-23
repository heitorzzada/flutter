import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/filme.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';
import 'cadastro_integrante_page.dart';

class ListaIntegrantePage extends StatelessWidget {
  const ListaIntegrantePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACERVO DE FILMES',
          style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 1.5),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Filme>>(
                stream: firestoreService.streamFilmes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Erro ao carregar acervo: ${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(color: AppTheme.error),
                        ),
                      ),
                    );
                  }

                  final filmes = snapshot.data ?? [];

                  if (filmes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.movie_outlined,
                            size: 64,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nenhum filme cadastrado no acervo.',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: AppTheme.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Clique no botão vermelho abaixo para adicionar.',
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
                    itemCount: filmes.length,
                    itemBuilder: (context, index) {
                      final filme = filmes[index];
                      final dataStr = filme.criadoEm != null
                          ? DateFormat('dd/MM/yyyy HH:mm').format(filme.criadoEm!)
                          : null;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        color: AppTheme.secondaryBackground,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(color: Color(0xFF2E2E3C)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppTheme.primary.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
                                ),
                                child: const Icon(
                                  Icons.play_circle_filled,
                                  color: AppTheme.primary,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filme.titulo,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.primaryText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: AppTheme.primary.withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            filme.genero,
                                            style: GoogleFonts.inter(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.accent,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            filme.anoClassificacao,
                                            style: GoogleFonts.inter(
                                              fontSize: 13,
                                              color: AppTheme.secondaryText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (dataStr != null) ...[
                                      const SizedBox(height: 6),
                                      Text(
                                        'Cadastrado em: $dataStr',
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          color: Colors.grey.shade500,
                                        ),
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

            // Botão Adicionar Filme
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroIntegrantePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, color: Colors.white, size: 24),
                  label: Text(
                    '+ CADASTRAR FILME NO ACERVO',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 18,
                      letterSpacing: 1.2,
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
