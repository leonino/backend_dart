import 'dart:convert';

class LocalModel {
  final int id;
  final String nome;

  LocalModel({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory LocalModel.fromMap(Map<String, dynamic> map) {
    return LocalModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalModel.fromJson(String source) =>
      LocalModel.fromMap(json.decode(source));
}
