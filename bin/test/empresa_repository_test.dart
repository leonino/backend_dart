import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../api/empresa/repositories/empresa_repository.dart';
import '../api/models/empresa_model.dart';
import '../infra/i_crud_repository.dart';
import '../infra/mysql_datasource.dart';

class MysqlDatasourceMock extends Mock implements MysqlDatasource {}

void main() {
  var datasource = MysqlDatasourceMock();
  var repository = EmpresaRepository(datasource);

  var retorno = [
    {"ID": "1", "CARGORESPONSAVEL": "EMPRESA EXEMPLO", "PESSOA_ID": "1"}
  ];

  test("Deve retornar um Model de Empresa", () async {
    var sql =
        "SELECT * FROM ${EmpresaModel.nomeTabela} WHERE ${EmpresaModel.keyId} = '1'";
    when(() => datasource.query(sql: sql))
        .thenAnswer((_) async => ResponseSQL(retorno));

    var resp = await repository.findById("1");
    var data = resp.data;
    expect(data, isA<EmpresaModel>());
    expect(data.cargoResponsavel, "EMPRESA EXEMPLO");
  });
  test("Deve retornar uma Lista de Pessoas", () async {
    var sql = "SELECT * FROM ${EmpresaModel.nomeTabela}";
    when(() => datasource.query(sql: sql))
        .thenAnswer((_) async => ResponseSQL(retorno));

    var resp = await repository.findAll();
    var lista = resp.data;
    expect(lista, isA<List<EmpresaModel>>());
    expect(lista[0].cargoResponsavel, "EMPRESA EXEMPLO");
  });
}
