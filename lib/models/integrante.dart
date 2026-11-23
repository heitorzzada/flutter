import 'package:cloud_firestore/cloud_firestore.dart';

class Integrante {
  final String id;
  final String nome;
  final String funcao;
  final String turma;
  final DateTime? criadoEm;

  Integrante({
    required this.id,
    required this.nome,
    required this.funcao,
    required this.turma,
    this.criadoEm,
  });

  factory Integrante.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    DateTime? dataCriacao;
    if (data['criado_em'] != null) {
      if (data['criado_em'] is Timestamp) {
        dataCriacao = (data['criado_em'] as Timestamp).toDate();
      } else if (data['criado_em'] is String) {
        dataCriacao = DateTime.tryParse(data['criado_em']);
      }
    }

    return Integrante(
      id: doc.id,
      nome: data['nome']?.toString() ?? '',
      funcao: data['funcao']?.toString() ?? '',
      turma: data['turma']?.toString() ?? '',
      criadoEm: dataCriacao,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': nome,
      'funcao': funcao,
      'turma': turma,
      'criado_em': FieldValue.serverTimestamp(),
    };
  }
}
