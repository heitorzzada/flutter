import 'package:cloud_firestore/cloud_firestore.dart';

class Filme {
  final String id;
  final String titulo;
  final String genero;
  final String anoClassificacao;
  final DateTime? criadoEm;

  Filme({
    required this.id,
    required this.titulo,
    required this.genero,
    required this.anoClassificacao,
    this.criadoEm,
  });

  factory Filme.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    DateTime? dataCriacao;
    if (data['criado_em'] != null) {
      if (data['criado_em'] is Timestamp) {
        dataCriacao = (data['criado_em'] as Timestamp).toDate();
      } else if (data['criado_em'] is String) {
        dataCriacao = DateTime.tryParse(data['criado_em']);
      }
    }

    return Filme(
      id: doc.id,
      titulo: data['titulo']?.toString() ?? data['nome']?.toString() ?? '',
      genero: data['genero']?.toString() ?? data['estilo']?.toString() ?? data['funcao']?.toString() ?? '',
      anoClassificacao: data['ano_classificacao']?.toString() ?? data['experiencia']?.toString() ?? data['turma']?.toString() ?? '',
      criadoEm: dataCriacao,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'titulo': titulo,
      'genero': genero,
      'ano_classificacao': anoClassificacao,
      'criado_em': FieldValue.serverTimestamp(),
    };
  }
}
