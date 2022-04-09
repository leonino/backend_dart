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
    {"ID": "1", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 1"},
    {"ID": "2", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 2"},
    {"ID": "3", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 3"},
    {"ID": "4", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 4"},
    {"ID": "5", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5"},
    {"ID": "6", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 6"},
    {"ID": "7", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 7"},
    {"ID": "8", "NMPESSOA": "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 8"},
  ];
  test("Deve retornar uma Lista de Pessoas", () async {
    var sql = "SELECT * FROM ${PessoaModel.nomeTabela}";
    when(() => datasource.query(sql: sql))
        .thenAnswer((_) async => ResponseSQL(retorno));
    var resp = await repository.findAll();
    var lista = resp.data;
    expect(lista, isA<List<PessoaModel>>());
    expect(lista[0].nmpessoa, retorno[0]["NMPESSOA"]);
  });

  test('Deve retornar uma pagina com 5 registros', () async {
    var datasource = MysqlDatasource();
    var repository = PessoaRepository(datasource);
    // var sql = "SELECT * FROM ${PessoaModel.nomeTabela}";
    // when(() => datasource
    //         .query(sql: sql,))
    //     .thenAnswer((_) async => ResponseSQL(retorno));
    var resp =
        await repository.findAll(paginator: {"pagina": "2", "limit": "5"});
    var lista = resp.data;
    expect(lista, isA<List<PessoaModel>>());
    expect(lista.length, 5);
  });

  test("Deve retornar um Model de Pessoa", () async {
    var sql =
        "SELECT * FROM ${PessoaModel.nomeTabela} WHERE ${PessoaModel.keyId} = '1'";
    when(() => datasource.query(sql: sql))
        .thenAnswer((_) async => ResponseSQL(retorno));
    var resp = await repository.findById("1");
    PessoaModel model = resp.data;
    expect(model, isA<PessoaModel>());
    expect(model.nmpessoa, retorno[0]["NMPESSOA"]);
  });
}
