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
          'Engenharia do Sistema',
          style: GoogleFonts.fraunces(
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
                      child: const Icon(Icons.schema_outlined, color: AppTheme.primary, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SISTEMA DE GESTÃO HORAS PÃES',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            'Modelagem técnica desenvolvida por Camila e Thaviny.',
                            style: GoogleFonts.plusJakartaSans(
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
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),

              _buildDiagramCard(
                title: 'Casos de Uso da Padaria Horas Pães',
                itens: [
                  'Ator: Mestre Padeira (Camila) -> Cadastrar novo pão no cardápio, definir horários de fermentação.',
                  'Ator: Gestora de Fornadas (Thaviny) -> Registrar lote de fornada, confirmar retirada de pão quente.',
                  'Ator: Cliente / Balcão -> Consultar cardápio artesanal, reservar encomenda, receber aviso de pão saindo do forno.',
                ],
              ),
              const SizedBox(height: 20),

              Text(
                '2. DIAGRAMA DE CLASSES & DADOS',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),

              _buildDiagramCard(
                title: 'Entidades do Software',
                itens: [
                  'Produto: id (String), nome (String), categoria (String), precoOuFornada (String), criadoEm (DateTime).',
                  'Fornada: id (String), clienteOuResponsavel (String), detalhesItens (String), criadoEm (DateTime).',
                  'FirestoreService: Singleton com streaming reativo bidirecional, fallback local sem bloqueio de rede.',
                ],
              ),
              const SizedBox(height: 20),

              Text(
                '3. FLUXO OPERACIONAL DE FORNADAS',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),

              _buildDiagramCard(
                title: 'Ciclo do Pedido à Mesa',
                itens: [
                  'Passo 1: Autólise e fermentação longa (48h de maturação).',
                  'Passo 2: Modelagem manual e descanso das massas.',
                  'Passo 3: Forno de lastro com injeção de vapor a cada hora.',
                  'Passo 4: Registro da fornada no app e liberação imediata para retirada no balcão.',
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiagramCard({
    required String title,
    required List<String> itens,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3B2F24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.fraunces(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 12),
          ...itens.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Icons.check_circle_outline, size: 14, color: AppTheme.primary),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: AppTheme.secondaryText,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
