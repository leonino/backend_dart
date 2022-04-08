import 'dart:convert';

// {
//   ID: 2,
//   ADMINISTRADOR: 1,
//   ATIVO: 1,
//   CODIGOACESSO: 242451994466601655743991887974,
//   GERENTE: 0,
//   LOGIN: admin,
//   SENHA: f6fdffe48c908deb0f4c3bd36c032e72,
//   SUPERVISOR: 1,
//   TIPOCODIGO: 1,
//   SYNC_DATAATUALIZACAO: null,
//   EMPRESA_ID: 1,
//   LOCAL_ID: 1,
//   PESSOA_ID: 2
//   }

class UsuarioModel {
  final int? id;
  final bool administrador;
  final bool ativo;
  final String codigoAcesso;
  final bool gerente;
  final String login;
  final String senha;
  final bool supervisor;
  final String tipoCodigo;
  final DateTime? syncDataAtualizacao;
  final int empresaId;
  final int localId;
  final int pessoaId;

  UsuarioModel({
    this.id,
    this.administrador = false,
    this.ativo = true,
    this.codigoAcesso = "1234",
    this.gerente = false,
    this.supervisor = false,
    required this.login,
    required this.senha,
    required this.tipoCodigo,
    this.syncDataAtualizacao,
    required this.empresaId,
    required this.localId,
    required this.pessoaId,
  });

  static String tabela = "padrao_usuario";

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'administrador': administrador,
      'ativo': ativo,
      'codigoAcesso': codigoAcesso,
      'gerente': gerente,
      'login': login,
      'senha': senha,
      'supervisor': supervisor,
      'tipoCodigo': tipoCodigo,
      'syncDataAtualizacao': syncDataAtualizacao?.millisecondsSinceEpoch,
      'empresa_id': empresaId,
      'local_id': localId,
      'pessoa_id': pessoaId,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: int.tryParse(map['ID']) ?? 0,
      administrador: map['ADMINISTRADOR'] == '1',
      ativo: map['ATIVO'] == '1',
      codigoAcesso: map['CODIGOACESSO'] ?? '',
      gerente: map['GERENTE'] == '1',
      login: map['LOGIN'] ?? '',
      senha: map['SENHA'] ?? '',
      supervisor: map['SUPERVIDOR'] == '1',
      tipoCodigo: map['TIPOCODIGO'] ?? '',
      syncDataAtualizacao: map['SYNC_DATAATUALIZACAO'] ?? DateTime.now(),
      empresaId: int.tryParse(map['EMPRESA_ID']) ?? 0,
      localId: int.tryParse(map['LOCAL_ID']) ?? 0,
      pessoaId: int.tryParse(map['PESSOA_ID']) ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));
}
