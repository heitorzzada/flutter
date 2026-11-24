import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';

class CadastroAtividadePage extends StatefulWidget {
  const CadastroAtividadePage({super.key});

  @override
  State<CadastroAtividadePage> createState() => _CadastroAtividadePageState();
}

class _CadastroAtividadePageState extends State<CadastroAtividadePage> {
  final _formKey = GlobalKey<FormState>();
  final _clienteController = TextEditingController();
  final _detalhesController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool _salvando = false;

  @override
  void dispose() {
    _clienteController.dispose();
    _detalhesController.dispose();
    super.dispose();
  }

  Future<void> _salvarFornada() async {
    final cliente = _clienteController.text.trim();
    final detalhes = _detalhesController.text.trim();

    if (cliente.isEmpty || detalhes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos da fornada / encomenda!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppTheme.error,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    setState(() => _salvando = true);

    try {
      await _firestoreService.cadastrarFornada(
        clienteOuResponsavel: cliente,
        detalhesItens: detalhes,
      );

      _clienteController.clear();
      _detalhesController.clear();

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar fornada: $e'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _salvando = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'REGISTRAR FORNADA / ENCOMENDA',
            style: GoogleFonts.fraunces(fontSize: 20, letterSpacing: 1.1),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Programar Lote Quente ou Encomenda Especial',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fraunces(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Cliente ou Responsável
                  TextFormField(
                    controller: _clienteController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Cliente / Responsável pela Encomenda',
                      hintText: 'Ex.: Mariana Silva (Café da Manhã) ou Fornada Geral Manhã',
                      prefixIcon: Icon(Icons.person_pin_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Detalhes da Fornada
                  TextFormField(
                    controller: _detalhesController,
                    maxLines: 3,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Pães, Quantidades & Horário de Retirada',
                      hintText: 'Ex.: 3x Sourdough Multigrãos + 5x Croissants Manteiga. Retirada às 08h30.',
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.schedule_outlined, color: AppTheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar Fornada
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarFornada,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppTheme.primary,
                      elevation: 3,
                    ),
                    child: _salvando
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF18130E)),
                            ),
                          )
                        : Text(
                            'CONFIRMAR FORNADA / ENCOMENDA',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: const Color(0xFF18130E),
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Voltar
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.list, color: AppTheme.primary),
                    label: Text(
                      'VER QUADRO DE FORNADAS',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppTheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
