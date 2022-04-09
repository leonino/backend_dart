import '../../../infra/i_crud_repository.dart';
import '../../../infra/db_my_sql.dart';
import '../../../infra/i_mysql_datasource.dart';
import '../../../utils/custom_typedef.dart';
import '../../models/pessoa_model.dart';

class PessoaRepository extends ICrudRepository<PessoaModel> {
  PessoaRepository(IDataSource ds) : super(ds);

  @override
  Future<ResponseSQL<List<PessoaModel>>> findAll({
    String? filtro,
    MapString? paginator,
  }) async {
    var sql = "SELECT * FROM ${PessoaModel.nomeTabela}";
    print(sql);
    var responseSQL = await ds.query(sql: sql, paginator: paginator);
    var data = responseSQL.data.map((row) => PessoaModel.fromMap(row)).toList();
    return ResponseSQL(
      data,
      rowsAfecteds: data.length,
      pagination: responseSQL.pagination,
      sql: responseSQL.sql,
    );
  }

  @override
  Future<ResponseSQL<PessoaModel>> findById(String id) async {
    var sql =
        "SELECT * FROM ${PessoaModel.nomeTabela} WHERE ${PessoaModel.keyId} = '$id'";
    print(sql);
    var responseSQL = await ds.query(sql: sql);
    var data = responseSQL.getData.map((row) => PessoaModel.fromMap(row)).first;
    return ResponseSQL(
      data,
      rowsAfecteds: responseSQL.data.length,
      pagination: responseSQL.pagination,
      sql: responseSQL.sql,
    );
  }

  @override
  Future<ResponseSQL<void>> deleteId(String id) async {
    var sql =
        "DELETE FROM ${PessoaModel.nomeTabela} WHERE ${PessoaModel.keyId} = '$id'";
    print(sql);
    var responseSQL = await ds.query(sql: sql);
    var rows = responseSQL.getData;
    return ResponseSQL(
      null,
      rowsAfecteds: rows.length,
      pagination: responseSQL.pagination,
      sql: responseSQL.sql,
    );
  }

  @override
  Future<ResponseSQL<PessoaModel>> save(MapStringOr map) async {
    String sql = DbMySQL.saveSQL(map, PessoaModel.nomeTabela);
    var responseSQL = await ds.query(sql: sql);
    var data = responseSQL.getData.map((row) => PessoaModel.fromMap(row)).first;
    return ResponseSQL(
      data,
      rowsAfecteds: responseSQL.getRowsAfecteds,
      pagination: responseSQL.pagination,
      sql: responseSQL.sql,
    );
  }
}
