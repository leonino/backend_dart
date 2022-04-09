import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../api/models/pessoa_model.dart';
import '../api/pessoa/repositories/pessoa_repository.dart';
import '../infra/mysql_datasource.dart';

class MysqlDatasourceMock extends Mock implements MysqlDatasource {}

void main() {
  var datasource = MysqlDatasourceMock();
  var repository = PessoaRepository(datasource);
  test("Deve retornar uma Lista de Pessoas", () async {
    var resp = await repository.findAll();
    var lista = resp.data;
    expect(lista, isA<List<PessoaModel>>());
    expect(lista[0].nmpessoa, "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5");
  });

  test("Deve retornar um Model de Pessoa", () async {
    var resp = await repository.findById("1");
    PessoaModel model = resp.data;
    expect(model, isA<PessoaModel>());
    expect(model.nmpessoa, "MAKEMALTE MAQUIAGENS E ESMALTES EIRELI 5");
  });
}
