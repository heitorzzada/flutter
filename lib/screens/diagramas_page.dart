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
          'Arquitetura do Sistema',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header da tela
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
                      child: const Icon(Icons.developer_mode, color: AppTheme.primary, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ENGENHARIA DO APP',
                            style: GoogleFonts.oswald(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Text(
                            'Diagramas técnicos baseados nas diretrizes do projeto integrador.',
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
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),

              // Card Caso de Uso
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackground,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF2E2E38)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: AppTheme.primary, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Atores & Interações',
                          style: GoogleFonts.cinzel(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildUseCaseRow('Cliente', 'Acessa informações sobre o tatuador e manual de cicatrização.'),
                    _buildUseCaseRow('Cliente', 'Registra solicitações de agendamento de tattoo (Entidade 2).'),
                    _buildUseCaseRow('Tatuador / Admin', 'Cadastra novos artistas e especialidades no estúdio (Entidade 1).'),
                    _buildUseCaseRow('Sistema', 'Sincroniza registros em tempo real via Cloud Firestore.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                '2. DIAGRAMA DE CLASSES & FIRESTORE',
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),

              // Card Classe 1: Tatuador
              _buildClassCard(
                className: 'Tatuador',
                collectionName: 'tatuador',
                fields: [
                  {'name': 'id', 'type': 'String', 'desc': 'Identificador único do documento'},
                  {'name': 'nome', 'type': 'String', 'desc': 'Nome do artista/tatuador'},
                  {'name': 'estilo', 'type': 'String', 'desc': 'Especialidade (Blackwork, Fineline...)'},
                  {'name': 'experiencia', 'type': 'String', 'desc': 'Tempo de atuação ou rede social'},
                  {'name': 'criado_em', 'type': 'Timestamp', 'desc': 'Data e hora do cadastro no servidor'},
                ],
              ),
              const SizedBox(height: 16),

              // Card Classe 2: Agendamento
              _buildClassCard(
                className: 'Agendamento',
                collectionName: 'agendamento',
                fields: [
                  {'name': 'id', 'type': 'String', 'desc': 'Identificador único do documento'},
                  {'name': 'titulo', 'type': 'String', 'desc': 'Ideia ou nome da tatuagem'},
                  {'name': 'descricao', 'type': 'String', 'desc': 'Detalhes da sessão, tamanho e local'},
                  {'name': 'criado_em', 'type': 'Timestamp', 'desc': 'Data e hora do cadastro no servidor'},
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
        border: Border.all(color: const Color(0xFF2E2E38)),
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
                child: const Icon(Icons.table_chart_outlined, color: AppTheme.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Classe $className',
                style: GoogleFonts.cinzel(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryText,
                ),
              ),
              const Spacer(),
              Text(
                'Coleção: $collectionName',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFF282834), thickness: 1),
          const SizedBox(height: 8),
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
