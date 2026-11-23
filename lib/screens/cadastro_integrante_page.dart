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
  final _estiloController = TextEditingController();
  final _experienciaController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool _salvando = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _estiloController.dispose();
    _experienciaController.dispose();
    super.dispose();
  }

  Future<void> _salvarTatuador() async {
    final nome = _nomeController.text.trim();
    final estilo = _estiloController.text.trim();
    final experiencia = _experienciaController.text.trim();

    if (nome.isEmpty || estilo.isEmpty || experiencia.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos do tatuador!',
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
      await _firestoreService.cadastrarTatuador(
        nome: nome,
        estilo: estilo,
        experiencia: experiencia,
      );

      _nomeController.clear();
      _estiloController.clear();
      _experienciaController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Tatuador cadastrado com sucesso no estúdio!',
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
            content: Text('Erro ao salvar: $e'),
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
            'Cadastro de Tatuador',
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
                    'Cadastre um novo artista no estúdio',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nome do Tatuador
                  TextFormField(
                    controller: _nomeController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Nome do Artista',
                      hintText: 'Ex.: André Silva',
                      prefixIcon: Icon(Icons.brush, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Estilo Artístico
                  TextFormField(
                    controller: _estiloController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Estilo Principal',
                      hintText: 'Ex.: Blackwork / Fineline / Old School',
                      prefixIcon: Icon(Icons.auto_awesome, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Experiência ou Redes
                  TextFormField(
                    controller: _experienciaController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Experiência / Contato',
                      hintText: 'Ex.: 5 anos de experiência | @andre.ink',
                      prefixIcon: Icon(Icons.badge_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarTatuador,
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
                            'Salvar Tatuador',
                            style: GoogleFonts.oswald(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),

                  // Voltar para lista
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.list, color: AppTheme.primary),
                    label: Text(
                      'Ver Lista de Tatuadores',
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
