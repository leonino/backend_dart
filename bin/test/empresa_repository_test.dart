import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../api/empresa/repositories/empresa_repository.dart';
import '../api/models/empresa_model.dart';
import '../infra/mysql_datasource.dart';

class MysqlDatasourceMock extends Mock implements MysqlDatasource {}

void main() {
  var datasource = MysqlDatasourceMock();
  var repository = EmpresaRepository(datasource);
  var retorno = [
    {"ID": "1", "CARGORESPONSAVEL": "EMPRESA EXEMPLO", "PESSOA_ID": "1"}
  ];

  test("Deve retornar um Model de Empresa", () async {
    when(() => datasource.query(any()))
        .thenAnswer((_) async => Future.value(retorno));

    var resp = await repository.findById("1");
    var data = resp.data;
    expect(data, isA<EmpresaModel>());
    expect(data.cargoResponsavel, "EMPRESA EXEMPLO");
  });
  test("Deve retornar uma Lista de Pessoas", () async {
    when(() => datasource.query(any()))
        .thenAnswer((_) async => Future.value(retorno));

    var resp = await repository.findAll();
    var lista = resp.data;
    expect(lista, isA<List<EmpresaModel>>());
    expect(lista[0].cargoResponsavel, "EMPRESA EXEMPLO");
  });
}
