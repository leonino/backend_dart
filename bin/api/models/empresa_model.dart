import 'dart:convert';
import '../../infra/i_model.dart';

class EmpresaModel extends IModel {
  static String get keyId => "id";
  static String get nomeTabela => "padrao_empresa";

  final int? id;
  final String cargoResponsavel;
  final int pessoaId;

  EmpresaModel({
    required this.id,
    required this.cargoResponsavel,
    required this.pessoaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'CARGORESPONSAVEL': cargoResponsavel,
      'PESSOA_ID': pessoaId,
    };
  }

  factory EmpresaModel.fromMap(Map<String, dynamic> map) {
    return EmpresaModel(
      id: int.parse(map['ID']),
      cargoResponsavel: map['CARGORESPONSAVEL'] ?? '',
      pessoaId: int.parse(map['PESSOA_ID']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpresaModel.fromJson(String source) =>
      EmpresaModel.fromMap(json.decode(source));
}

Map empresaMap = {
  "ID": 1,
  "ATIVO": 0,
  "CAMINHOIMG": null,
  "CARGORESPONSAVEL": "PROPRIETARIO",
  "CRT": 1,
  "DATAEXPIRACAO": "g4givf0g",
  "DATAINATIVIDADE": null,
  "DATASINCRONIZACAO": null,
  "EMPRESASIGLA": "ME",
  "LOGOEMPRESA": "adfasdfasdfasdf",
  "NUMMAQUINA": 4,
  "RESPONSAVEL": "JUNIOR",
  "SERIALHD": "zobsphyk4gdlidkm100vyk03tzfs2rnj1ciocvt9ccch9k",
  "TELEFONEEMPRESA": "",
  "SYNC_DATAATUALIZACAO": null,
  "ANEXOARQUIVO_ID": 1,
  "GRUPOEMPRESA_ID": 1,
  "PESSOA_ID": 1,
  "DTULTIMASINCRONIZACAO": "5s1d31gy"
};
