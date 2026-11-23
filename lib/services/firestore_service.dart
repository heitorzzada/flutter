import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/integrante.dart';
import '../models/atividade.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Coleções configuradas de acordo com as regras de segurança
  CollectionReference get _integranteRef => _firestore.collection('integrante');
  CollectionReference get _atividadeRef => _firestore.collection('atividade');

  // ==========================================
  // ENTIDADE 1: INTEGRANTE
  // ==========================================

  // List of Documents com atualização em tempo real
  // Ordena por data de criação (do mais recente para o mais antigo)
  Stream<List<Integrante>> streamIntegrantes() {
    return _integranteRef.snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => Integrante.fromFirestore(doc)).toList();
      // Ordenação local segura (caso ainda não tenha índice composto no Firestore)
      list.sort((a, b) {
        if (a.criadoEm == null && b.criadoEm == null) return 0;
        if (a.criadoEm == null) return 1;
        if (b.criadoEm == null) return -1;
        return b.criadoEm!.compareTo(a.criadoEm!);
      });
      return list;
    });
  }

  // Create Document na coleção 'integrante'
  Future<void> cadastrarIntegrante({
    required String nome,
    required String funcao,
    required String turma,
  }) async {
    await _integranteRef.add({
      'nome': nome.trim(),
      'funcao': funcao.trim(),
      'turma': turma.trim(),
      'criado_em': FieldValue.serverTimestamp(),
    });
  }

  // ==========================================
  // ENTIDADE 2: ATIVIDADE
  // ==========================================

  // List of Documents com atualização em tempo real
  // Ordena por data de criação (do mais recente para o mais antigo)
  Stream<List<Atividade>> streamAtividades() {
    return _atividadeRef.snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => Atividade.fromFirestore(doc)).toList();
      // Ordenação local segura
      list.sort((a, b) {
        if (a.criadoEm == null && b.criadoEm == null) return 0;
        if (a.criadoEm == null) return 1;
        if (b.criadoEm == null) return -1;
        return b.criadoEm!.compareTo(a.criadoEm!);
      });
      return list;
    });
  }

  // Create Document na coleção 'atividade'
  Future<void> cadastrarAtividade({
    required String titulo,
    required String descricao,
  }) async {
    await _atividadeRef.add({
      'titulo': titulo.trim(),
      'descricao': descricao.trim(),
      'criado_em': FieldValue.serverTimestamp(),
    });
  }
}
