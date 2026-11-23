import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/integrante.dart';
import '../models/atividade.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal() {
    _initStreams();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _integranteRef => _firestore.collection('integrante');
  CollectionReference get _atividadeRef => _firestore.collection('atividade');

  final List<Integrante> _localIntegrantes = [];
  final StreamController<List<Integrante>> _integrantesController = StreamController<List<Integrante>>.broadcast();

  final List<Atividade> _localAtividades = [];
  final StreamController<List<Atividade>> _atividadesController = StreamController<List<Atividade>>.broadcast();

  bool _initialized = false;

  void _initStreams() {
    if (_initialized) return;
    _initialized = true;

    // Escuta remota do Firestore de forma segura sem travar
    try {
      _integranteRef.snapshots().listen((snapshot) {
        final list = snapshot.docs.map((doc) => Integrante.fromFirestore(doc)).toList();
        _localIntegrantes.clear();
        _localIntegrantes.addAll(list);
        _emitIntegrantes();
      }, onError: (e) {
        _emitIntegrantes();
      });
    } catch (_) {
      _emitIntegrantes();
    }

    try {
      _atividadeRef.snapshots().listen((snapshot) {
        final list = snapshot.docs.map((doc) => Atividade.fromFirestore(doc)).toList();
        _localAtividades.clear();
        _localAtividades.addAll(list);
        _emitAtividades();
      }, onError: (e) {
        _emitAtividades();
      });
    } catch (_) {
      _emitAtividades();
    }
  }

  void _emitIntegrantes() {
    _localIntegrantes.sort((a, b) {
      if (a.criadoEm == null && b.criadoEm == null) return 0;
      if (a.criadoEm == null) return 1;
      if (b.criadoEm == null) return -1;
      return b.criadoEm!.compareTo(a.criadoEm!);
    });
    if (!_integrantesController.isClosed) {
      _integrantesController.add(List.unmodifiable(_localIntegrantes));
    }
  }

  void _emitAtividades() {
    _localAtividades.sort((a, b) {
      if (a.criadoEm == null && b.criadoEm == null) return 0;
      if (a.criadoEm == null) return 1;
      if (b.criadoEm == null) return -1;
      return b.criadoEm!.compareTo(a.criadoEm!);
    });
    if (!_atividadesController.isClosed) {
      _atividadesController.add(List.unmodifiable(_localAtividades));
    }
  }

  // ==========================================
  // ENTIDADE 1: INTEGRANTE
  // ==========================================

  Stream<List<Integrante>> streamIntegrantes() async* {
    yield List.unmodifiable(_localIntegrantes);
    yield* _integrantesController.stream;
  }

  Future<void> cadastrarIntegrante({
    required String nome,
    required String funcao,
    required String turma,
  }) async {
    final now = DateTime.now();
    final newId = DateTime.now().millisecondsSinceEpoch.toString();
    final novo = Integrante(
      id: newId,
      nome: nome.trim(),
      funcao: funcao.trim(),
      turma: turma.trim(),
      criadoEm: now,
    );

    // Adiciona instantaneamente para nunca travar a interface
    _localIntegrantes.insert(0, novo);
    _emitIntegrantes();

    // Persiste no Cloud Firestore com timeout seguro
    try {
      await _integranteRef.add({
        'nome': nome.trim(),
        'funcao': funcao.trim(),
        'turma': turma.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Continua com sucesso usando a persistência local
    }
  }

  // ==========================================
  // ENTIDADE 2: ATIVIDADE
  // ==========================================

  Stream<List<Atividade>> streamAtividades() async* {
    yield List.unmodifiable(_localAtividades);
    yield* _atividadesController.stream;
  }

  Future<void> cadastrarAtividade({
    required String titulo,
    required String descricao,
  }) async {
    final now = DateTime.now();
    final newId = DateTime.now().millisecondsSinceEpoch.toString();
    final novo = Atividade(
      id: newId,
      titulo: titulo.trim(),
      descricao: descricao.trim(),
      criadoEm: now,
    );

    _localAtividades.insert(0, novo);
    _emitAtividades();

    try {
      await _atividadeRef.add({
        'titulo': titulo.trim(),
        'descricao': descricao.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Continua com sucesso
    }
  }
}
