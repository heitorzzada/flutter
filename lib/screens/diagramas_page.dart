import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class DiagramasPage extends StatelessWidget {
  const DiagramasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        title: Text(
          'ARQUITETURA DA LOCADORA',
          style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 1.5),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Informativo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.schema, color: AppTheme.primary, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SISTEMA CINEMELHADO',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              letterSpacing: 1.2,
                              color: AppTheme.primary,
                            ),
                          ),
                          Text(
                            'Modelagem técnica do sistema de locação e acervo no Cloud Firestore.',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                '1. DIAGRAMA DE CASOS DE USO',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  letterSpacing: 1.2,
                  color: AppTheme.secondary,
                ),
              ),
              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF2E2E3C)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.movie, color: AppTheme.primary, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Fluxos de Aluguel & Acervo',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildUseCaseRow('Cliente', 'Consulta acervo de filmes disponíveis (Entidade 1).'),
                    _buildUseCaseRow('Cliente', 'Realiza locação de títulos por período (Entidade 2).'),
                    _buildUseCaseRow('Atendente', 'Cadastra novos títulos e mídias no acervo da locadora.'),
                    _buildUseCaseRow('Sistema', 'Atualiza o status de locações e sincroniza via Firestore.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                '2. DIAGRAMA DE CLASSES & FIRESTORE',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                  letterSpacing: 1.2,
                  color: AppTheme.secondary,
                ),
              ),
              const SizedBox(height: 10),

              // Classe 1: Filme
              _buildClassCard(
                className: 'Filme',
                collectionName: 'filme',
                fields: [
                  {'name': 'id', 'type': 'String', 'desc': 'Chave primária do documento'},
                  {'name': 'titulo', 'type': 'String', 'desc': 'Nome do filme'},
                  {'name': 'genero', 'type': 'String', 'desc': 'Gênero (Ficção, Clássico...)'},
                  {'name': 'ano_classificacao', 'type': 'String', 'desc': 'Ano, mídia e faixa etária'},
                  {'name': 'criado_em', 'type': 'Timestamp', 'desc': 'Data de cadastro no acervo'},
                ],
              ),
              const SizedBox(height: 14),

              // Classe 2: Locacao
              _buildClassCard(
                className: 'Locacao',
                collectionName: 'locacao',
                fields: [
                  {'name': 'id', 'type': 'String', 'desc': 'Chave primária do documento'},
                  {'name': 'cliente_nome', 'type': 'String', 'desc': 'Nome do cliente locatário'},
                  {'name': 'detalhes', 'type': 'String', 'desc': 'Filmes alugados e prazo'},
                  {'name': 'criado_em', 'type': 'Timestamp', 'desc': 'Data da retirada da mídia'},
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildUseCaseRow(String actor, String action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              actor,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppTheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              action,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.secondaryText,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildClassCard({
    required String className,
    required String collectionName,
    required List<Map<String, String>> fields,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2E2E3C)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.table_rows_outlined, color: AppTheme.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Classe $className',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                ),
              ),
              const Spacer(),
              Text(
                'Coleção: $collectionName',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppTheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFF2A2A38), thickness: 1),
          const SizedBox(height: 6),
          ...fields.map(
            (field) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    '+ ${field['name']}',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    ': ${field['type']}',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    field['desc']!,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
