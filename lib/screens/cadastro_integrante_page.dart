import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/firestore_service.dart';
import '../theme/app_theme.dart';

class CadastroIntegrantePage extends StatefulWidget {
  const CadastroIntegrantePage({super.key});

  @override
  State<CadastroIntegrantePage> createState() => _CadastroIntegrantePageState();
}

class _CadastroIntegrantePageState extends State<CadastroIntegrantePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _funcaoController = TextEditingController();
  final _turmaController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool _salvando = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _funcaoController.dispose();
    _turmaController.dispose();
    super.dispose();
  }

  Future<void> _salvarIntegrante() async {
    final nome = _nomeController.text.trim();
    final funcao = _funcaoController.text.trim();
    final turma = _turmaController.text.trim();

    // Validação de campos vazios com alerta
    if (nome.isEmpty || funcao.isEmpty || turma.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos antes de salvar!',
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
      await _firestoreService.cadastrarIntegrante(
        nome: nome,
        funcao: funcao,
        turma: turma,
      );

      // Limpar campos
      _nomeController.clear();
      _funcaoController.clear();
      _turmaController.clear();

      if (mounted) {
        // Retorna para a tela de lista passando true para disparar o pop-up
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar integrante: $e'),
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
            'Cadastro de integrantes',
            style: GoogleFonts.interTight(
              fontSize: 20,
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Preencha os dados do integrante',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Campo Nome
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Ex.: Ana Clara',
                      prefixIcon: Icon(Icons.person, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo Função
                  TextFormField(
                    controller: _funcaoController,
                    decoration: const InputDecoration(
                      labelText: 'Função',
                      hintText: 'Ex.: Designer / Desenvolvedor',
                      prefixIcon: Icon(Icons.work_outline, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo Turma
                  TextFormField(
                    controller: _turmaController,
                    decoration: const InputDecoration(
                      labelText: 'Turma',
                      hintText: 'Ex.: 3º Ano Informática',
                      prefixIcon: Icon(Icons.school_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarIntegrante,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppTheme.primary,
                      elevation: 2,
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
                            'Salvar',
                            style: GoogleFonts.interTight(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Botão Voltar para Lista
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.list, color: AppTheme.primary),
                    label: Text(
                      'Ver Lista de Integrantes',
                      style: GoogleFonts.interTight(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w600,
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
