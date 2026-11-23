import 'package:cloud_firestore/cloud_firestore.dart';

class Tatuador {
  final String id;
  final String nome;
  final String estilo;
  final String experiencia;
  final DateTime? criadoEm;

  Tatuador({
    required this.id,
    required this.nome,
    required this.estilo,
    required this.experiencia,
    this.criadoEm,
  });

  factory Tatuador.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    DateTime? dataCriacao;
    if (data['criado_em'] != null) {
      if (data['criado_em'] is Timestamp) {
        dataCriacao = (data['criado_em'] as Timestamp).toDate();
      } else if (data['criado_em'] is String) {
        dataCriacao = DateTime.tryParse(data['criado_em']);
      }
    }

    return Tatuador(
      id: doc.id,
      nome: data['nome']?.toString() ?? '',
      estilo: data['estilo']?.toString() ?? data['funcao']?.toString() ?? '',
      experiencia: data['experiencia']?.toString() ?? data['turma']?.toString() ?? '',
      criadoEm: dataCriacao,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': nome,
      'estilo': estilo,
      'experiencia': experiencia,
      'criado_em': FieldValue.serverTimestamp(),
    };
  }
}
