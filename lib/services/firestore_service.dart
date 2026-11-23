import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/filme.dart';
import '../models/locacao.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _filmeRef => _firestore.collection('filme');
  CollectionReference get _locacaoRef => _firestore.collection('locacao');

  // ==========================================
  // ENTIDADE 1: FILME (Acervo da Locadora)
  // ==========================================

  Stream<List<Filme>> streamFilmes() {
    return _filmeRef.snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => Filme.fromFirestore(doc)).toList();
      list.sort((a, b) {
        if (a.criadoEm == null && b.criadoEm == null) return 0;
        if (a.criadoEm == null) return 1;
        if (b.criadoEm == null) return -1;
        return b.criadoEm!.compareTo(a.criadoEm!);
      });
      return list;
    });
  }

  Future<void> cadastrarFilme({
    required String titulo,
    required String genero,
    required String anoClassificacao,
  }) async {
    await _filmeRef.add({
      'titulo': titulo.trim(),
      'genero': genero.trim(),
      'ano_classificacao': anoClassificacao.trim(),
      'criado_em': FieldValue.serverTimestamp(),
    });
  }

  // ==========================================
  // ENTIDADE 2: LOCAÇÃO (Aluguéis de Filmes)
  // ==========================================

  Stream<List<Locacao>> streamLocacoes() {
    return _locacaoRef.snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => Locacao.fromFirestore(doc)).toList();
      list.sort((a, b) {
        if (a.criadoEm == null && b.criadoEm == null) return 0;
        if (a.criadoEm == null) return 1;
        if (b.criadoEm == null) return -1;
        return b.criadoEm!.compareTo(a.criadoEm!);
      });
      return list;
    });
  }

  Future<void> cadastrarLocacao({
    required String clienteNome,
    required String detalhesLocacao,
  }) async {
    await _locacaoRef.add({
      'cliente_nome': clienteNome.trim(),
      'detalhes': detalhesLocacao.trim(),
      'criado_em': FieldValue.serverTimestamp(),
    });
  }
}
