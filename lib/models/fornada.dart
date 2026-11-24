import 'package:cloud_firestore/cloud_firestore.dart';

class Fornada {
  final String id;
  final String clienteOuResponsavel;
  final String detalhesItens;
  final DateTime? criadoEm;

  Fornada({
    required this.id,
    required this.clienteOuResponsavel,
    required this.detalhesItens,
    this.criadoEm,
  });

  factory Fornada.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Fornada(
      id: doc.id,
      clienteOuResponsavel: data['cliente_ou_responsavel'] ?? data['cliente_nome'] ?? '',
      detalhesItens: data['detalhes_itens'] ?? data['detalhes'] ?? '',
      criadoEm: (data['criado_em'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cliente_ou_responsavel': clienteOuResponsavel,
      'detalhes_itens': detalhesItens,
      'criado_em': criadoEm != null ? Timestamp.fromDate(criadoEm!) : FieldValue.serverTimestamp(),
    };
  }
}
