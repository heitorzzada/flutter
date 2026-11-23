import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/filme.dart';
import '../models/locacao.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _filmeRef => _firestore.collection('filme');
  CollectionReference get _locacaoRef => _firestore.collection('locacao');

  final List<Filme> _localFilmes = [];
  final StreamController<List<Filme>> _filmesController = StreamController<List<Filme>>.broadcast();
  bool _filmesListenerStarted = false;

  final List<Locacao> _localLocacoes = [];
  final StreamController<List<Locacao>> _locacoesController = StreamController<List<Locacao>>.broadcast();
  bool _locacoesListenerStarted = false;

  // ==========================================
  // ENTIDADE 1: FILME (Acervo da Locadora)
  // ==========================================

  Stream<List<Filme>> streamFilmes() async* {
    yield List.unmodifiable(_localFilmes);

    if (!_filmesListenerStarted) {
      _filmesListenerStarted = true;
      _filmeRef.snapshots().listen(
        (snapshot) {
          final list = snapshot.docs.map((doc) => Filme.fromFirestore(doc)).toList();
          list.sort((a, b) {
            if (a.criadoEm == null && b.criadoEm == null) return 0;
            if (a.criadoEm == null) return 1;
            if (b.criadoEm == null) return -1;
            return b.criadoEm!.compareTo(a.criadoEm!);
          });
          _localFilmes
            ..clear()
            ..addAll(list);
          _filmesController.add(List.unmodifiable(_localFilmes));
        },
        onError: (e) {
          _filmesController.add(List.unmodifiable(_localFilmes));
        },
      );
    }

    yield* _filmesController.stream;
  }

  Future<void> cadastrarFilme({
    required String titulo,
    required String genero,
    required String anoClassificacao,
  }) async {
    final novoFilme = Filme(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}',
      titulo: titulo.trim(),
      genero: genero.trim(),
      anoClassificacao: anoClassificacao.trim(),
      criadoEm: DateTime.now(),
    );

    _localFilmes.insert(0, novoFilme);
    _filmesController.add(List.unmodifiable(_localFilmes));

    try {
      await _filmeRef.add({
        'titulo': titulo.trim(),
        'genero': genero.trim(),
        'ano_classificacao': anoClassificacao.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Mantém registro local garantido sem travar UI
    }
  }

  // ==========================================
  // ENTIDADE 2: LOCAÇÃO (Aluguéis de Filmes)
  // ==========================================

  Stream<List<Locacao>> streamLocacoes() async* {
    yield List.unmodifiable(_localLocacoes);

    if (!_locacoesListenerStarted) {
      _locacoesListenerStarted = true;
      _locacaoRef.snapshots().listen(
        (snapshot) {
          final list = snapshot.docs.map((doc) => Locacao.fromFirestore(doc)).toList();
          list.sort((a, b) {
            if (a.criadoEm == null && b.criadoEm == null) return 0;
            if (a.criadoEm == null) return 1;
            if (b.criadoEm == null) return -1;
            return b.criadoEm!.compareTo(a.criadoEm!);
          });
          _localLocacoes
            ..clear()
            ..addAll(list);
          _locacoesController.add(List.unmodifiable(_localLocacoes));
        },
        onError: (e) {
          _locacoesController.add(List.unmodifiable(_localLocacoes));
        },
      );
    }

    yield* _locacoesController.stream;
  }

  Future<void> cadastrarLocacao({
    required String clienteNome,
    required String detalhesLocacao,
  }) async {
    final novaLocacao = Locacao(
      id: 'local_${DateTime.now().millisecondsSinceEpoch}',
      clienteNome: clienteNome.trim(),
      detalhesLocacao: detalhesLocacao.trim(),
      criadoEm: DateTime.now(),
    );

    _localLocacoes.insert(0, novaLocacao);
    _locacoesController.add(List.unmodifiable(_localLocacoes));

    try {
      await _locacaoRef.add({
        'cliente_nome': clienteNome.trim(),
        'detalhes': detalhesLocacao.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Mantém registro local garantido sem travar UI
    }
  }
}
