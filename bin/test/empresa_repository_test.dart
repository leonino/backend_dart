import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../api/empresa/repositories/empresa_repository.dart';
import '../api/models/empresa_model.dart';

class EmpresaRepositoryMock extends Mock implements EmpresaRepository {}

void main() {
  var repository = EmpresaRepository();

  test("Deve retornar um Model de Empresa", () async {
    var resp = await repository.findById("1");
    var data = resp.data;
    expect(data, isA<EmpresaModel>());
  });

  test("Deve retornar uma Lista de Pessoas", () async {
    var resp = await repository.findAll();
    var lista = resp.data;
    expect(lista, isA<List<EmpresaModel>>());
  });
}
