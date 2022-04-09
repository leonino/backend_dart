import '../../../infra/i_crud_repository.dart';
import '../../../infra/db_my_sql.dart';
import '../../../infra/i_mysql_datasource.dart';
import '../../../utils/utils.dart';
import '../../models/pessoa_model.dart';

class PessoaRepository extends ICrudRepository<PessoaModel> {
  final pool = DbMySQL.db;

  PessoaRepository(IDataSource ds) : super(ds);

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
  Future<ResponseCrud<void>> deleteId(String id) async {
    var sql =
        "DELETE FROM ${PessoaModel.nomeTabela} WHERE ${PessoaModel.keyId} = '$id'";
    print(sql);
    var rows = await ds.query(sql);
    return ResponseCrud(null, rowsAfecteds: rows.length);
  }

  @override
  Future<ResponseCrud<PessoaModel>> save(MapStringOr map) async {
    String sql = DbMySQL.saveSQL(map, PessoaModel.nomeTabela);
    var rows = await ds.query(sql);
    var data = rows.map((row) => PessoaModel.fromMap(row)).first;
    return ResponseCrud(data, rowsAfecteds: rows.length);
  }
}
