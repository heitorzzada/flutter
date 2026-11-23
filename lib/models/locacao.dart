import 'package:cloud_firestore/cloud_firestore.dart';

class Locacao {
  final String id;
  final String clienteNome;
  final String detalhesLocacao;
  final DateTime? criadoEm;

  Locacao({
    required this.id,
    required this.clienteNome,
    required this.detalhesLocacao,
    this.criadoEm,
  });

  factory Locacao.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    DateTime? dataCriacao;
    if (data['criado_em'] != null) {
      if (data['criado_em'] is Timestamp) {
        dataCriacao = (data['criado_em'] as Timestamp).toDate();
      } else if (data['criado_em'] is String) {
        dataCriacao = DateTime.tryParse(data['criado_em']);
      }
    }

    return Locacao(
      id: doc.id,
      clienteNome: data['cliente_nome']?.toString() ?? data['titulo']?.toString() ?? '',
      detalhesLocacao: data['detalhes']?.toString() ?? data['descricao']?.toString() ?? '',
      criadoEm: dataCriacao,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'cliente_nome': clienteNome,
      'detalhes': detalhesLocacao,
      'criado_em': FieldValue.serverTimestamp(),
    };
  }
}
