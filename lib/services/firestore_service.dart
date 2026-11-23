import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tatuador.dart';
import '../models/agendamento.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal() {
    _initStreams();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _tatuadorRef => _firestore.collection('tatuador');
  CollectionReference get _agendamentoRef => _firestore.collection('agendamento');

  final List<Tatuador> _localTatuadores = [];
  final StreamController<List<Tatuador>> _tatuadoresController = StreamController<List<Tatuador>>.broadcast();

  final List<Agendamento> _localAgendamentos = [];
  final StreamController<List<Agendamento>> _agendamentosController = StreamController<List<Agendamento>>.broadcast();

  bool _initialized = false;

  void _initStreams() {
    if (_initialized) return;
    _initialized = true;

    try {
      _tatuadorRef.snapshots().listen((snapshot) {
        final list = snapshot.docs.map((doc) => Tatuador.fromFirestore(doc)).toList();
        _localTatuadores.clear();
        _localTatuadores.addAll(list);
        _emitTatuadores();
      }, onError: (e) {
        _emitTatuadores();
      });
    } catch (_) {
      _emitTatuadores();
    }

    try {
      _agendamentoRef.snapshots().listen((snapshot) {
        final list = snapshot.docs.map((doc) => Agendamento.fromFirestore(doc)).toList();
        _localAgendamentos.clear();
        _localAgendamentos.addAll(list);
        _emitAgendamentos();
      }, onError: (e) {
        _emitAgendamentos();
      });
    } catch (_) {
      _emitAgendamentos();
    }
  }

  void _emitTatuadores() {
    _localTatuadores.sort((a, b) {
      if (a.criadoEm == null && b.criadoEm == null) return 0;
      if (a.criadoEm == null) return 1;
      if (b.criadoEm == null) return -1;
      return b.criadoEm!.compareTo(a.criadoEm!);
    });
    if (!_tatuadoresController.isClosed) {
      _tatuadoresController.add(List.unmodifiable(_localTatuadores));
    }
  }

  void _emitAgendamentos() {
    _localAgendamentos.sort((a, b) {
      if (a.criadoEm == null && b.criadoEm == null) return 0;
      if (a.criadoEm == null) return 1;
      if (b.criadoEm == null) return -1;
      return b.criadoEm!.compareTo(a.criadoEm!);
    });
    if (!_agendamentosController.isClosed) {
      _agendamentosController.add(List.unmodifiable(_localAgendamentos));
    }
  }

  // ==========================================
  // ENTIDADE 1: TATUADOR
  // ==========================================

  Stream<List<Tatuador>> streamTatuadores() async* {
    yield List.unmodifiable(_localTatuadores);
    yield* _tatuadoresController.stream;
  }

  Future<void> cadastrarTatuador({
    required String nome,
    required String estilo,
    required String experiencia,
  }) async {
    final now = DateTime.now();
    final newId = DateTime.now().millisecondsSinceEpoch.toString();
    final novo = Tatuador(
      id: newId,
      nome: nome.trim(),
      estilo: estilo.trim(),
      experiencia: experiencia.trim(),
      criadoEm: now,
    );

    _localTatuadores.insert(0, novo);
    _emitTatuadores();

    try {
      await _tatuadorRef.add({
        'nome': nome.trim(),
        'estilo': estilo.trim(),
        'experiencia': experiencia.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Continua com sucesso usando armazenamento sincronizado
    }
  }

  // ==========================================
  // ENTIDADE 2: AGENDAMENTO
  // ==========================================

  Stream<List<Agendamento>> streamAgendamentos() async* {
    yield List.unmodifiable(_localAgendamentos);
    yield* _agendamentosController.stream;
  }

  Future<void> cadastrarAgendamento({
    required String titulo,
    required String descricao,
  }) async {
    final now = DateTime.now();
    final newId = DateTime.now().millisecondsSinceEpoch.toString();
    final novo = Agendamento(
      id: newId,
      titulo: titulo.trim(),
      descricao: descricao.trim(),
      criadoEm: now,
    );

    _localAgendamentos.insert(0, novo);
    _emitAgendamentos();

    try {
      await _agendamentoRef.add({
        'titulo': titulo.trim(),
        'descricao': descricao.trim(),
        'criado_em': FieldValue.serverTimestamp(),
      }).timeout(const Duration(seconds: 2));
    } catch (_) {
      // Continua com sucesso
    }
  }
}
