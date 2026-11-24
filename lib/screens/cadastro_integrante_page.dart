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
  final _categoriaController = TextEditingController();
  final _precoFornadaController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();
  bool _salvando = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _categoriaController.dispose();
    _precoFornadaController.dispose();
    super.dispose();
  }

  Future<void> _salvarProduto() async {
    final nome = _nomeController.text.trim();
    final categoria = _categoriaController.text.trim();
    final precoFornada = _precoFornadaController.text.trim();

    if (nome.isEmpty || categoria.isEmpty || precoFornada.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Por favor, preencha todos os campos do pão ou produto!',
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
      await _firestoreService.cadastrarProduto(
        nome: nome,
        categoria: categoria,
        precoOuFornada: precoFornada,
      );

      _nomeController.clear();
      _categoriaController.clear();
      _precoFornadaController.clear();

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao cadastrar produto: $e'),
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
            'CADASTRAR NOVO PÃO / PRODUTO',
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
                    'Adicionar ao Cardápio Horas Pães',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fraunces(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nome do Pão ou Doce
                  TextFormField(
                    controller: _nomeController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Nome do Pão / Doce',
                      hintText: 'Ex.: Sourdough Multigrãos',
                      prefixIcon: Icon(Icons.bakery_dining_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Categoria
                  TextFormField(
                    controller: _categoriaController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Categoria / Tipo de Massa',
                      hintText: 'Ex.: Fermentação Natural / Folhado Francês / Confeitaria',
                      prefixIcon: Icon(Icons.category_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Preço e Fornada
                  TextFormField(
                    controller: _precoFornadaController,
                    style: const TextStyle(color: AppTheme.primaryText),
                    decoration: const InputDecoration(
                      labelText: 'Preço & Horário de Fornada',
                      hintText: 'Ex.: R\$ 19,00 | Fornadas às 08h e 16h',
                      prefixIcon: Icon(Icons.sell_outlined, color: AppTheme.primary),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Botão Salvar Produto
                  ElevatedButton(
                    onPressed: _salvando ? null : _salvarProduto,
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
                            'ADICIONAR AO CARDÁPIO',
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
                      'VER CARDÁPIO DE PÃES',
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
