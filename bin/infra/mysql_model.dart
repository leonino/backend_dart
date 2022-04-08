import 'package:mysql_client/mysql_client.dart';

import 'db_my_sql.dart';
import '../utils/constantes.dart';
import 'i_model.dart';

class MysqlModel<T extends IModel> {
  final pool = DbMySQL.db;

  @override
  Future<MapFilter> execute(String query,
      [Map<String, dynamic>? params, bool iterable = false]) async {
    try {
      var result = await pool.execute(query, params, iterable);
      var resp = result.rows.first.assoc();
      return resp;
    } catch (e) {
      throw Exception("Error ao recuperar dados do MySQL => [$query]");
    }
  }

  Future<PreparedStmt> prepare(String query, [bool iterable = false]) async {
    try {
      var stmt = await pool.prepare(query, iterable);
      return stmt;
    } catch (e) {
      throw Exception("Error ao preparar statement do MySQL => [$query]");
    }
  }

  String modelCatalog(String query) {
    var type = T.runtimeType.toString();
    if (query.contains(type)) {
      query.replaceAll(type, (T as IModel).toString());
    }
    return query;
  }
}
