import 'package:cloud_firestore/cloud_firestore.dart';

class Atividade {
  final String id;
  final String titulo;
  final String descricao;
  final DateTime? criadoEm;

  Atividade({
    required this.id,
    required this.titulo,
    required this.descricao,
    this.criadoEm,
  });

  factory Atividade.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    DateTime? dataCriacao;
    if (data['criado_em'] != null) {
      if (data['criado_em'] is Timestamp) {
        dataCriacao = (data['criado_em'] as Timestamp).toDate();
      } else if (data['criado_em'] is String) {
        dataCriacao = DateTime.tryParse(data['criado_em']);
      }
    }

    return Atividade(
      id: doc.id,
      titulo: data['titulo']?.toString() ?? '',
      descricao: data['descricao']?.toString() ?? '',
      criadoEm: dataCriacao,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'criado_em': FieldValue.serverTimestamp(),
    };
  }
}
