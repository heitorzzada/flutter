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

  Future<void> _salvarAgendamento() async {
    final titulo = _tituloController.text.trim();
    final descricao = _descricaoController.text.trim();

    if (titulo.isEmpty || descricao.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos da sessão!',
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
      await _firestoreService.cadastrarAgendamento(
        titulo: titulo,
        descricao: descricao,
      );

      _tituloController.clear();
      _descricaoController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Agendamento de tattoo registrado com sucesso!',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
            content: Text('Erro ao salvar agendamento: $e'),
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
            'Novo Agendamento',
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Registre uma nova sessão de tatuagem',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Título / Ideia
                  TextFormField(
                    controller: _tituloController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Ideia / Nome da Tatuagem',
                      hintText: 'Ex.: Dragão Oriental no Antebraço',
                      prefixIcon: Icon(Icons.create, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Descrição / Detalhes
                  TextFormField(
                    controller: _descricaoController,
                    maxLines: 3,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Detalhes da Sessão',
                      hintText: 'Ex.: Tamanho 15cm, sombreado preto e cinza, cliente André.',
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.notes, color: AppTheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarAgendamento,
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
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          )
                        : Text(
                            'Salvar Agendamento',
                            style: GoogleFonts.oswald(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Voltar
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.list, color: AppTheme.primary),
                    label: Text(
                      'Ver Lista de Agendamentos',
                      style: GoogleFonts.oswald(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
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
