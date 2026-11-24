import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/produto.dart';
import '../models/fornada.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _produtoRef => _firestore.collection('produtos_padaria');
  CollectionReference get _fornadaRef => _firestore.collection('fornadas_padaria');

  final List<Produto> _localProdutos = [];
  final StreamController<List<Produto>> _produtosController = StreamController<List<Produto>>.broadcast();
  bool _produtosListenerStarted = false;

  final List<Fornada> _localFornadas = [];
  final StreamController<List<Fornada>> _fornadasController = StreamController<List<Fornada>>.broadcast();
  bool _fornadasListenerStarted = false;

  // ==========================================
  // ENTIDADE 1: PRODUTOS & PÃES DA HORAS PÃES
  // ==========================================

  Stream<List<Produto>> streamProdutos() async* {
    // Retorna imediatamente os dados locais para evitar tela de loading infinito
    yield List.unmodifiable(_localProdutos);

    if (!_produtosListenerStarted) {
      _produtosListenerStarted = true;
      _produtoRef.snapshots().listen(
        (snapshot) {
          final list = snapshot.docs.map((doc) => Produto.fromFirestore(doc)).toList();
          list.sort((a, b) {
            if (a.criadoEm == null && b.criadoEm == null) return 0;
            if (a.criadoEm == null) return 1;
            if (b.criadoEm == null) return -1;
            return b.criadoEm!.compareTo(a.criadoEm!);
          });
          _localProdutos
            ..clear()
            ..addAll(list);
          _produtosController.add(List.unmodifiable(_localProdutos));
        },
        onError: (e) {
          // Mantém dados locais sem travar a interface
          _produtosController.add(List.unmodifiable(_localProdutos));
        },
      );
    }

    yield* _produtosController.stream;
  }

  Future<void> cadastrarProduto({
    required String nome,
    required String categoria,
    required String precoOuFornada,
  }) async {
    final novoProduto = Produto(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}',
      nome: nome.trim(),
      categoria: categoria.trim(),
      precoOuFornada: precoOuFornada.trim(),
      criadoEm: DateTime.now(),
    );

    _localProdutos.insert(0, novoProduto);
    _produtosController.add(List.unmodifiable(_localProdutos));

    try {
      await _produtoRef.add({
        'nome': nome.trim(),
        'categoria': categoria.trim(),
        'preco_ou_fornada': precoOuFornada.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Offline ou sem conexão: cache local garante reatividade instantânea
    }
  }

  // ==========================================
  // ENTIDADE 2: FORNADAS & PEDIDOS / ENCOMENDAS
  // ==========================================

  Stream<List<Fornada>> streamFornadas() async* {
    yield List.unmodifiable(_localFornadas);

    if (!_fornadasListenerStarted) {
      _fornadasListenerStarted = true;
      _fornadaRef.snapshots().listen(
        (snapshot) {
          final list = snapshot.docs.map((doc) => Fornada.fromFirestore(doc)).toList();
          list.sort((a, b) {
            if (a.criadoEm == null && b.criadoEm == null) return 0;
            if (a.criadoEm == null) return 1;
            if (b.criadoEm == null) return -1;
            return b.criadoEm!.compareTo(a.criadoEm!);
          });
          _localFornadas
            ..clear()
            ..addAll(list);
          _fornadasController.add(List.unmodifiable(_localFornadas));
        },
        onError: (e) {
          _fornadasController.add(List.unmodifiable(_localFornadas));
        },
      );
    }

    yield* _fornadasController.stream;
  }

  Future<void> cadastrarFornada({
    required String clienteOuResponsavel,
    required String detalhesItens,
  }) async {
    final novaFornada = Fornada(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}',
      clienteOuResponsavel: clienteOuResponsavel.trim(),
      detalhesItens: detalhesItens.trim(),
      criadoEm: DateTime.now(),
    );

    _localFornadas.insert(0, novaFornada);
    _fornadasController.add(List.unmodifiable(_localFornadas));

    try {
      await _fornadaRef.add({
        'cliente_ou_responsavel': clienteOuResponsavel.trim(),
        'detalhes_itens': detalhesItens.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Offline ou sem conexão: cache local garante reatividade instantânea
    }
  }
}
