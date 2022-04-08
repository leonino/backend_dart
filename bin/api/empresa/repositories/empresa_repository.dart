import '../../../infra/I_crud_repository.dart';
import '../../models/empresa_model.dart';

class EmpresaRepository implements ICrudRepository<EmpresaModel> {
  @override
  Future<ResponseCrud<EmpresaModel>> findById(String id) async {
    var sql =
        "SELECT * FROM ${EmpresaModel.nomeTabela} WHERE ${EmpresaModel.keyId} = '$id'";
    print(sql);
    var result = await ICrudRepository.pool.execute(sql);
    var rows = result.rows.first.assoc();
    var data = EmpresaModel.fromMap(rows);
    return ResponseCrud(data, rowsAfecteds: rows.length);
  }

  @override
  Future<ResponseCrud<List<EmpresaModel>>> findAll([String? filtro]) async {
    var sql = "SELECT * FROM ${EmpresaModel.nomeTabela}";
    print(sql);
    var result = await ICrudRepository.pool.execute(sql);
    var lista = result.rows.map((e) => e.assoc());
    var data = lista.map((item) => EmpresaModel.fromMap(item)).toList();
    return ResponseCrud(data, rowsAfecteds: data.length);
  }

  @override
  Future<ResponseCrud<EmpresaModel>> updateById(EmpresaModel model) {
    // TODO: implement updateById
    throw UnimplementedError();
  }

  @override
  Future<ResponseCrud<EmpresaModel>> deleteId(String id) {
    // TODO: implement deleteId
    throw UnimplementedError();
  }
}
