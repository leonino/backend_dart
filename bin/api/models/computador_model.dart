import 'dart:convert';

import 'empresa_model.dart';
import 'local_model.dart';

class ComputadorModel {
  final int? id;
  final bool ativo;
  final String ip;
  final String nome;
  final DateTime syncDataAtualizacao;
  final EmpresaModel empresa;
  final LocalModel local;
  final String hash;

  ComputadorModel({
    this.id,
    this.ativo = true,
    this.nome = "",
    this.hash = "",
    required this.ip,
    required this.syncDataAtualizacao,
    required this.empresa,
    required this.local,
  });

  get key => id;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ativo': ativo,
      'ip': ip,
      'nmcomputador': nome,
      'sync_dataatualizacao': syncDataAtualizacao.millisecondsSinceEpoch,
      'empresa': empresa.toMap(),
      'local': local.toMap(),
      'hash': hash,
    };
  }

  factory ComputadorModel.fromMap(Map<String, dynamic> map) {
    return ComputadorModel(
      id: map['id']?.toInt(),
      ativo: map['ativo'] ?? false,
      ip: map['ip'] ?? '',
      nome: map['NMCOMPUTADOR'] ?? '',
      syncDataAtualizacao:
          DateTime.fromMillisecondsSinceEpoch(map['syncDataAtualizacao']),
      empresa: EmpresaModel.fromMap(map['empresa']),
      local: LocalModel.fromMap(map['local']),
      hash: map['hash'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ComputadorModel.fromJson(String source) =>
      ComputadorModel.fromMap(json.decode(source));
}

// Table: padrao_computador
// Columns:
// ID int AI PK
// ATIVO tinyint(1)
// IP varchar(20)
// NMCOMPUTADOR varchar(50)
// SYNC_DATAATUALIZACAO datetime
// EMPRESA_ID int
// LOCAL_ID int
// hash varchar(255)
