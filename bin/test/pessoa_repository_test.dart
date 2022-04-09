import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../api/models/pessoa_model.dart';
import '../api/pessoa/repositories/pessoa_repository.dart';
import '../infra/i_crud_repository.dart';
import '../infra/mysql_datasource.dart';

class MysqlDatasourceMock extends Mock implements MysqlDatasource {}

void main() {
  var datasource = MysqlDatasourceMock();
  var repository = PessoaRepository(datasource);
  var retorno = [
    {
      "ID": "1",
      "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5",
    }
  ];
  test("Deve retornar uma Lista de Pessoas", () async {
    var sql = "SELECT * FROM ${PessoaModel.nomeTabela}";
    when(() => datasource.query(sql: sql))
        .thenAnswer((_) async => ResponseSQL(retorno));
    var resp = await repository.findAll();
    var lista = resp.data;
    expect(lista, isA<List<PessoaModel>>());
    expect(lista[0].nmpessoa, "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5");
  });

  test("Deve retornar um Model de Pessoa", () async {
    var sql =
        "SELECT * FROM ${PessoaModel.nomeTabela} WHERE ${PessoaModel.keyId} = '1'";
    when(() => datasource.query(sql: sql))
        .thenAnswer((_) async => ResponseSQL(retorno));
    var resp = await repository.findById("1");
    PessoaModel model = resp.data;
    expect(model, isA<PessoaModel>());
    expect(model.nmpessoa, "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5");
  });
}
