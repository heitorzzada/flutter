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
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool _salvando = false;

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  Future<void> _salvarAtividade() async {
    final titulo = _tituloController.text.trim();
    final descricao = _descricaoController.text.trim();

    // Validação de campos vazios com alerta
    if (titulo.isEmpty || descricao.isEmpty) {
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
      await _firestoreService.cadastrarAtividade(
        titulo: titulo,
        descricao: descricao,
      );

      // Limpar campos
      _tituloController.clear();
      _descricaoController.clear();

      if (mounted) {
        // Retorna para a tela de lista passando true para disparar o pop-up
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar atividade: $e'),
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
            'Cadastro de atividades',
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
                    'Preencha os dados da atividade',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Campo Título
                  TextFormField(
                    controller: _tituloController,
                    decoration: const InputDecoration(
                      labelText: 'Título da atividade',
                      hintText: 'Ex.: Caminhada Matinal',
                      prefixIcon: Icon(Icons.fitness_center, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Campo Descrição
                  TextFormField(
                    controller: _descricaoController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Descrição da atividade',
                      hintText: 'Ex.: Caminhar 30 minutos no parque para melhorar o condicionamento.',
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.description_outlined, color: AppTheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarAtividade,
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
                      'Ver Lista de Atividades',
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
