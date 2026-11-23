import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tatuador.dart';
import '../models/agendamento.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _tatuadorRef => _firestore.collection('tatuador');
  CollectionReference get _agendamentoRef => _firestore.collection('agendamento');

  // ==========================================
  // ENTIDADE 1: TATUADOR (Artistas do Estúdio)
  // ==========================================

  Stream<List<Tatuador>> streamTatuadores() {
    return _tatuadorRef.snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => Tatuador.fromFirestore(doc)).toList();
      list.sort((a, b) {
        if (a.criadoEm == null && b.criadoEm == null) return 0;
        if (a.criadoEm == null) return 1;
        if (b.criadoEm == null) return -1;
        return b.criadoEm!.compareTo(a.criadoEm!);
      });
      return list;
    });
  }

  Future<void> cadastrarTatuador({
    required String nome,
    required String estilo,
    required String experiencia,
  }) async {
    await _tatuadorRef.add({
      'nome': nome.trim(),
      'estilo': estilo.trim(),
      'experiencia': experiencia.trim(),
      'criado_em': FieldValue.serverTimestamp(),
    });
  }

  // ==========================================
  // ENTIDADE 2: AGENDAMENTO / SESSÕES
  // ==========================================

  Stream<List<Agendamento>> streamAgendamentos() {
    return _agendamentoRef.snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => Agendamento.fromFirestore(doc)).toList();
      list.sort((a, b) {
        if (a.criadoEm == null && b.criadoEm == null) return 0;
        if (a.criadoEm == null) return 1;
        if (b.criadoEm == null) return -1;
        return b.criadoEm!.compareTo(a.criadoEm!);
      });
      return list;
    });
  }

  Future<void> cadastrarAgendamento({
    required String titulo,
    required String descricao,
  }) async {
    await _agendamentoRef.add({
      'titulo': titulo.trim(),
      'descricao': descricao.trim(),
      'criado_em': FieldValue.serverTimestamp(),
    });
  }
}
