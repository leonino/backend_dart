import 'dart:convert';
import '../../infra/i_model.dart';

class PessoaModel implements IModel {
  static String get keyId => "id";
  static String get nomeTabela => "padrao_pessoa";

  final int? id;
  final String? cpfcnpj;
  final DateTime? dataexpedicaorg;
  final DateTime? datanascimento;
  final String? descricaoemail;
  final String? email;
  final String? estadocivil;
  final String? naturalidadecidade;
  final String? nmfantasia;
  final String? nmpessoa;
  final String? orgaoemissorrg;
  final String? rgie;
  final String? sexo;
  final String? telefonecelular;
  final String? telefonecomercial;
  final String? telefoneresidencia;
  final int? tipopessoa;
  final String? syncDataatualizacao;
  final String? estadoemissorrgCUf;
  final String? fotoperfilId;
  final String? naturalidadeestadoCUf;
  final String? operadoratelefoneId;
  final String? iepesoafisica;

  PessoaModel({
    this.id,
    this.cpfcnpj,
    this.dataexpedicaorg,
    this.datanascimento,
    this.descricaoemail,
    this.email,
    this.estadocivil,
    this.naturalidadecidade,
    this.nmfantasia,
    this.nmpessoa,
    this.orgaoemissorrg,
    this.rgie,
    this.sexo,
    this.telefonecelular,
    this.telefonecomercial,
    this.telefoneresidencia,
    this.tipopessoa,
    this.syncDataatualizacao,
    this.estadoemissorrgCUf,
    this.fotoperfilId,
    this.naturalidadeestadoCUf,
    this.operadoratelefoneId,
    this.iepesoafisica,
  });

  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "CPFCNPJ": cpfcnpj,
      "DATAEXPEDICAORG": dataexpedicaorg?.toIso8601String() ?? "null",
      "DATANASCIMENTO": datanascimento?.toIso8601String() ?? "null",
      "DESCRICAOEMAIL": descricaoemail,
      "EMAIL": email,
      "ESTADOCIVIL": estadocivil,
      "NATURALIDADECIDADE": naturalidadecidade,
      "NMFANTASIA": nmfantasia,
      "NMPESSOA": nmpessoa,
      "ORGAOEMISSORRG": orgaoemissorrg,
      "RGIE": rgie,
      "SEXO": sexo,
      "TELEFONECELULAR": telefonecelular,
      "TELEFONECOMERCIAL": telefonecomercial,
      "TELEFONERESIDENCIA": telefoneresidencia,
      "TIPOPESSOA": tipopessoa,
      "SYNC_DATAATUALIZACAO": syncDataatualizacao,
      "ESTADOEMISSORRG_cUF": estadoemissorrgCUf,
      "FOTOPERFIL_ID": fotoperfilId,
      "NATURALIDADEESTADO_cUF": naturalidadeestadoCUf,
      "OPERADORATELEFONE_ID": operadoratelefoneId,
      "IEPESOAFISICA": iepesoafisica,
    };
  }

  factory PessoaModel.fromMap(Map<String, dynamic> map) {
    return PessoaModel(
      id: int.parse(map['ID']),
      cpfcnpj: map['CPFCNPJ'] ?? '',
      dataexpedicaorg: DateTime.parse(map["DATAEXPEDICAORG"] ?? "2022-04-05"),
      datanascimento: DateTime.parse(map["DATANASCIMENTO"] ?? "2022-04-05"),
      descricaoemail: map["DESCRICAOEMAIL"],
      email: map["EMAIL"],
      estadocivil: map["ESTADOCIVIL"],
      naturalidadecidade: map["NATURALIDADECIDADE"],
      nmfantasia: map["NMFANTASIA"],
      nmpessoa: map["NMPESSOA"],
      orgaoemissorrg: map["ORGAOEMISSORRG"],
      rgie: map["RGIE"],
      sexo: map["SEXO"],
      telefonecelular: map["TELEFONECELULAR"],
      telefonecomercial: map["TELEFONECOMERCIAL"],
      telefoneresidencia: map["TELEFONERESIDENCIA"],
      tipopessoa: int.parse(map["TIPOPESSOA"] ?? "1"),
      syncDataatualizacao: map["SYNC_DATAATUALIZACAO"],
      estadoemissorrgCUf: map["ESTADOEMISSORRG_cUF"],
      fotoperfilId: map["FOTOPERFIL_ID"],
      naturalidadeestadoCUf: map["NATURALIDADEESTADO_cUF"],
      operadoratelefoneId: map["OPERADORATELEFONE_ID"],
      iepesoafisica: map["IEPESOAFISICA"],
    );
  }

  factory PessoaModel.fromJson(String source) =>
      PessoaModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  factory PessoaModel.empty() => PessoaModel();
}

Map pessoaMap = {
  "ID": 1,
  "CPFCNPJ": "20810665000178",
  "DATAEXPEDICAORG": null,
  "DATANASCIMENTO": null,
  "DESCRICAOEMAIL": null,
  "EMAIL": "",
  "ESTADOCIVIL": null,
  "NATURALIDADECIDADE": null,
  "NMFANTASIA": "MAKEMALTE MAQUIAGENS E ESMALTES",
  "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5",
  "ORGAOEMISSORRG": null,
  "RGIE": "154583502",
  "SEXO": null,
  "TELEFONECELULAR": null,
  "TELEFONECOMERCIAL": null,
  "TELEFONERESIDENCIA": null,
  "TIPOPESSOA": 1,
  "SYNC_DATAATUALIZACAO": null,
  "ESTADOEMISSORRG_cUF": null,
  "FOTOPERFIL_ID": null,
  "NATURALIDADEESTADO_cUF": null,
  "OPERADORATELEFONE_ID": null,
  "IEPESOAFISICA": null
};
