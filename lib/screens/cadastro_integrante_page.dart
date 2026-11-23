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
  final _tituloController = TextEditingController();
  final _generoController = TextEditingController();
  final _anoController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool _salvando = false;

  @override
  void dispose() {
    _tituloController.dispose();
    _generoController.dispose();
    _anoController.dispose();
    super.dispose();
  }

  Future<void> _salvarFilme() async {
    final titulo = _tituloController.text.trim();
    final genero = _generoController.text.trim();
    final ano = _anoController.text.trim();

    if (titulo.isEmpty || genero.isEmpty || ano.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos do filme!',
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
      await _firestoreService.cadastrarFilme(
        titulo: titulo,
        genero: genero,
        anoClassificacao: ano,
      );

      _tituloController.clear();
      _generoController.clear();
      _anoController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Filme adicionado ao acervo com sucesso! 🎬',
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
            content: Text('Erro ao salvar filme: $e'),
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
            'CADASTRAR NOVO FILME',
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
                    'Adicionar Mídia ao Acervo CineMelhado',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Título do Filme
                  TextFormField(
                    controller: _tituloController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Título do Filme',
                      hintText: 'Ex.: Interestelar',
                      prefixIcon: Icon(Icons.movie_creation_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Gênero
                  TextFormField(
                    controller: _generoController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Gênero Cinematográfico',
                      hintText: 'Ex.: Ficção Científica / Suspense / Clássico',
                      prefixIcon: Icon(Icons.category_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Ano e Classificação
                  TextFormField(
                    controller: _anoController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Ano / Mídia / Classificação',
                      hintText: 'Ex.: 2014 | Bluray 4K | 12 Anos',
                      prefixIcon: Icon(Icons.album_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar Filme
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarFilme,
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
                            'SALVAR NO ACERVO',
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
                      'VER ACERVO DE FILMES',
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
