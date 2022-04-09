import '../utils/utils.dart';
import 'db_my_sql.dart';
import 'i_mysql_datasource.dart';

class MysqlDatasource implements IDataSource {
  var pool = DbMySQL.db;

  @override
  Future<List<MapStringOr>> query(String sql) async {
    print(sql);
    var result = await pool.execute(sql);
    var rows = result.rows.map((item) => item.assoc()).toList();
    return rows;
  }
}
