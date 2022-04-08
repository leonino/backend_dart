import 'dart:convert';

import 'computador_model.dart';

class ImpressoraModel {
  final int id;
  final String nome;
  final ComputadorModel computador;

  ImpressoraModel({
    required this.id,
    required this.nome,
    required this.computador,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'computador': computador.toMap(),
    };
  }

  factory ImpressoraModel.fromMap(Map<String, dynamic> map) {
    return ImpressoraModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      computador: ComputadorModel.fromMap(map['computador']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpressoraModel.fromJson(String source) =>
      ImpressoraModel.fromMap(json.decode(source));
}
