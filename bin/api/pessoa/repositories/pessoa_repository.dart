import '../../../infra/I_crud_repository.dart';
import '../../../infra/db_my_sql.dart';
import '../../models/pessoa_model.dart';

class PessoaRepository implements ICrudRepository<PessoaModel> {
  final pool = DbMySQL.db;

  @override
  Future<ResponseCrud<PessoaModel>> deleteId(String id) {
    // TODO: implement deleteId
    throw UnimplementedError();
  }

  @override
  Future<ResponseCrud<List<PessoaModel>>> findAll([String? filtro]) async {
    var sql = "SELECT * FROM ${PessoaModel.nomeTabela}";
    print(sql);
    var result = await pool.execute(sql);
    var lista = result.rows.map((e) => e.assoc());
    var data = lista.map((item) => PessoaModel.fromMap(item)).toList();
    return ResponseCrud(data, rowsAfecteds: data.length);
  }

  @override
  Future<ResponseCrud<PessoaModel>> findById(String id) async {
    var sql =
        "SELECT * FROM ${PessoaModel.nomeTabela} WHERE ${PessoaModel.keyId} = '$id'";
    print(sql);
    var result = await pool.execute(sql);
    var rows = result.rows.first.assoc();
    var data = PessoaModel.fromMap(rows);
    return ResponseCrud(data, rowsAfecteds: rows.length);
  }

  @override
  Future<ResponseCrud<PessoaModel>> updateById(PessoaModel model) {
    // TODO: implement updateById
    throw UnimplementedError();
  }
}
