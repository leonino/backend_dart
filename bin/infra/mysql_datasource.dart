import '../utils/custom_typedef.dart';
import 'db_my_sql.dart';
import 'i_crud_repository.dart';
import 'i_mysql_datasource.dart';
import 'meta_data.dart';

class MysqlDatasource implements IDataSource {
  var pool = DbMySQL.db;
  static final _limit = 25;

  @override
  Future<ResponseSQL<List<MapStringOr>>> query({
    required String sql,
    String? filter,
    MapString? paginator,
  }) async {
    var resp = await _reponseGenerator(sql: sql, paginator: paginator);
    print("MySQL [${resp.getSql}]");

    var result = await pool.execute(resp.getSql);
    var rows = result.rows.map((item) => item.assoc()).toList();
    var response = await _reponseGenerator(
        sql: resp.getSql, paginator: paginator, data: rows);
    return response;
  }

  Future<ResponseSQL<List<MapStringOr>>> _reponseGenerator({
    required String sql,
    List<MapStringOr>? data,
    MapString? paginator,
  }) async {
    bool isPag = paginator != null && paginator.keys.contains("pagina");
    var pagina = int.parse(paginator?['pagina'] ?? "1");
    var limit = int.parse(paginator?['limit'] ?? "$_limit");
    var offset = (pagina - 1) * limit;

    var _totalRows = await _estimativaRows("padrao_pessoa");
    var _totalPages = (_totalRows / limit).truncate();
    _totalPages += (_totalRows > (_totalPages * limit)) ? 1 : 0;
    var _nextPage = (pagina + 1).clamp(0, _totalPages);
    var _currentRows = data?.length ?? limit;
    var _nextPageOffset = (offset + limit);
    var _pagesRemaining = _totalPages - pagina;
    var _rowsRemaining = (_totalRows - _nextPageOffset).clamp(0, limit);

    var _sql = sql.split("LIMIT")[0].trim();
    if (isPag) {
      _sql = _sql + " LIMIT $limit OFFSET $offset";
    }
    var _meta = Meta(
      currentRows: _currentRows,
      nextPage: isPag && _nextPage > pagina ? "$_nextPage" : "",
      nextPageOffset: isPag ? _nextPageOffset : 0,
      pagesRemaining: isPag ? _pagesRemaining : 0,
      rowsRemaining: isPag ? _rowsRemaining : 0,
      totalPages: isPag ? _totalPages : 1,
      totalRows: _totalRows,
    );

    return ResponseSQL<List<MapStringOr>>(
      data ?? [],
      sql: _sql,
      pagination: _meta,
    );
  }

  Future<int> _estimativaRows(String nomeTabela) async {
    var sql = '''
      SELECT table_rows FROM information_schema.TABLES
      WHERE TABLE_SCHEMA = '${DbMySQL.db.databaseName}' AND
      TABLE_NAME = '$nomeTabela'
      ''';
    sql = sql.trim();
    var rows = await pool.execute(sql);
    var result = rows.rows.first.assoc();
    var data = int.parse(result["TABLE_ROWS"] ?? "0");
    return data;
  }
}
