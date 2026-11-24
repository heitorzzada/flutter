import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  final String id;
  final String nome;
  final String categoria;
  final String precoOuFornada;
  final DateTime? criadoEm;

  Produto({
    required this.id,
    required this.nome,
    required this.categoria,
    required this.precoOuFornada,
    this.criadoEm,
  });

  factory Produto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Produto(
      id: doc.id,
      nome: data['nome'] ?? data['titulo'] ?? '',
      categoria: data['categoria'] ?? data['genero'] ?? '',
      precoOuFornada: data['preco_ou_fornada'] ?? data['ano_classificacao'] ?? '',
      criadoEm: (data['criado_em'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'categoria': categoria,
      'preco_ou_fornada': precoOuFornada,
      'criado_em': criadoEm != null ? Timestamp.fromDate(criadoEm!) : FieldValue.serverTimestamp(),
    };
  }
}
