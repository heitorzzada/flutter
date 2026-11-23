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

  Future<void> _salvarLocacao() async {
    final cliente = _clienteController.text.trim();
    final detalhes = _detalhesController.text.trim();

    if (cliente.isEmpty || detalhes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos da locação!',
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
      await _firestoreService.cadastrarLocacao(
        clienteNome: cliente,
        detalhesLocacao: detalhes,
      );

      _clienteController.clear();
      _detalhesController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Locação de filme registrada com sucesso! 🎟️',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: AppTheme.primary,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar locação: $e'),
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
            'REGISTRAR LOCAÇÃO',
            style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 1.2),
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
                    'Novo Aluguel de Filmes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nome do Cliente
                  TextFormField(
                    controller: _clienteController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Nome do Sócio / Cliente',
                      hintText: 'Ex.: Felipe Melhado',
                      prefixIcon: Icon(Icons.person_pin_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Filme e Período
                  TextFormField(
                    controller: _detalhesController,
                    maxLines: 3,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Filmes Alugados & Prazos',
                      hintText: 'Ex.: Interestelar (Bluray) + Matrix (VHS) - Prazo: 3 dias.',
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.confirmation_number_outlined, color: AppTheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar Locação
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarLocacao,
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
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'CONFIRMAR LOCAÇÃO',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              letterSpacing: 1.5,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Voltar
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.list, color: AppTheme.primary),
                    label: Text(
                      'VER QUADRO DE LOCAÇÕES',
                      style: GoogleFonts.bebasNeue(
                        color: AppTheme.primary,
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
