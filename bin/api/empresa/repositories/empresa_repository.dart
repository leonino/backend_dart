import '../../../infra/i_crud_repository.dart';
import '../../../infra/db_my_sql.dart';
import '../../../infra/i_mysql_datasource.dart';

import '../../../utils/custom_typedef.dart';
import '../../models/empresa_model.dart';

class EmpresaRepository extends ICrudRepository<EmpresaModel> {
  EmpresaRepository(IDataSource ds) : super(ds);

  @override
  Future<ResponseSQL<EmpresaModel>> findById(String id) async {
    var sql =
        "SELECT * FROM ${EmpresaModel.nomeTabela} WHERE ${EmpresaModel.keyId} = '$id'";
    print(sql);
    var responseSQL = await ds.query(sql: sql);
    var data = responseSQL.data.map((row) => EmpresaModel.fromMap(row)).first;
    return ResponseSQL(
      data,
      rowsAfecteds: responseSQL.getData.length,
      pagination: responseSQL.pagination,
      sql: responseSQL.sql,
    );
  }

  @override
  Future<ResponseSQL<List<EmpresaModel>>> findAll({
    String? filtro,
    MapString? paginator,
  }) async {
    var sql = "SELECT * FROM ${EmpresaModel.nomeTabela}";
    var resposeSQL = await ds.query(sql: sql);
    var data =
        resposeSQL.data.map((item) => EmpresaModel.fromMap(item)).toList();
    return ResponseSQL(
      data,
      rowsAfecteds: data.length,
      pagination: resposeSQL.pagination,
      sql: resposeSQL.sql,
    );
  }

  @override
  Future<ResponseSQL<void>> deleteId(String id) async {
    var sql =
        "DELETE FROM ${EmpresaModel.nomeTabela} WHERE ${EmpresaModel.keyId} = '$id'";
    print(sql);
    var responseSQL = await ds.query(sql: sql);
    return responseSQL;
  }

  @override
  Future<ResponseSQL<EmpresaModel>> save(MapStringOr map) async {
    String sql = DbMySQL.saveSQL(map, EmpresaModel.nomeTabela);
    var responseSQL = await ds.query(sql: sql);
    var data = responseSQL.data.map((row) => EmpresaModel.fromMap(row)).first;
    return ResponseSQL(
      data,
      rowsAfecteds: responseSQL.getData.length,
      pagination: responseSQL.pagination,
      sql: responseSQL.sql,
    );
  }
}


//  'insert into users (name, email, age) values (?, ?, ?)',
//       ['Bob', 'bob@bob.com', 25]);
// Update some data
// await conn.query('update users set age=? where name=?', [26, 'Bob']);
// final numbers = <double>[10, 2, 5, 0.5];
// final result = numbers.reduce((value, element) => value + element);
