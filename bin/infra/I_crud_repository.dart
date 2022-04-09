import '../utils/custom_typedef.dart';
import 'db_my_sql.dart';
import 'i_mysql_datasource.dart';
import 'meta_data.dart';

abstract class ICrudRepository<T> {
  static final pool = DbMySQL.db;
  final IDataSource ds;

  ICrudRepository(this.ds);

  IDataSource get datasource => ds;

  Future<ResponseSQL<T>> findById(String id);
  Future<ResponseSQL<List<T>>> findAll({
    String? filtro,
    MapString? paginator,
  });
  Future<ResponseSQL<T>> save(MapStringOr map);
  Future<ResponseSQL<void>> deleteId(String id);
}

class ResponseSQL<T> {
  final Meta? pagination;
  final T data;
  final int? rowsAfecteds;
  final String? sql;

  ResponseSQL(
    this.data, {
    this.sql,
    this.rowsAfecteds,
    this.pagination,
  });

  T get getData => data;
  int get getRowsAfecteds => rowsAfecteds ?? 0;
  Meta get getPagination => pagination ?? Meta();
  String get getSql => sql ?? "";
}
