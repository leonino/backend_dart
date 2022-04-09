import '../../../infra/i_crud_repository.dart';
import '../../../infra/db_my_sql.dart';
import '../../../infra/i_mysql_datasource.dart';

import '../../../utils/utils.dart';
import '../../models/empresa_model.dart';

class EmpresaRepository extends ICrudRepository<EmpresaModel> {
  EmpresaRepository(IDataSource ds) : super(ds);

  @override
  Future<ResponseCrud<EmpresaModel>> findById(String id) async {
    var sql =
        "SELECT * FROM ${EmpresaModel.nomeTabela} WHERE ${EmpresaModel.keyId} = '$id'";
    print(sql);
    var rows = await ds.query(sql);
    var data = rows.map((row) => EmpresaModel.fromMap(row)).first;
    return ResponseCrud(data, rowsAfecteds: rows.length);
  }

  @override
  Future<ResponseCrud<List<EmpresaModel>>> findAll([String? filtro]) async {
    var sql = "SELECT * FROM ${EmpresaModel.nomeTabela}";
    var rows = await ds.query(sql);
    var data = rows.map((item) => EmpresaModel.fromMap(item)).toList();
    return ResponseCrud(data, rowsAfecteds: data.length);
  }

  @override
  Future<ResponseCrud<void>> deleteId(String id) async {
    var sql =
        "DELETE FROM ${EmpresaModel.nomeTabela} WHERE ${EmpresaModel.keyId} = '$id'";
    print(sql);
    var rows = await ds.query(sql);
    return ResponseCrud(null, rowsAfecteds: rows.length);
  }

  @override
  Future<ResponseCrud<EmpresaModel>> save(MapStringOr map) async {
    String sql = DbMySQL.saveSQL(map, EmpresaModel.nomeTabela);
    var rows = await ds.query(sql);
    var data = rows.map((row) => EmpresaModel.fromMap(row)).first;
    return ResponseCrud(data, rowsAfecteds: rows.length);
  }
}


//  'insert into users (name, email, age) values (?, ?, ?)',
//       ['Bob', 'bob@bob.com', 25]);
// Update some data
// await conn.query('update users set age=? where name=?', [26, 'Bob']);
// final numbers = <double>[10, 2, 5, 0.5];
// final result = numbers.reduce((value, element) => value + element);
