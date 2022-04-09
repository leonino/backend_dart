import '../utils/utils.dart';
import 'db_my_sql.dart';
import 'i_model.dart';
import 'i_mysql_datasource.dart';

abstract class ICrudRepository<T extends IModel> {
  static final pool = DbMySQL.db;
  final IDataSource ds;

  ICrudRepository(this.ds);

  IDataSource get datasource => ds;

  Future<ResponseCrud<T>> findById(String id);
  Future<ResponseCrud<List<T>>> findAll([String? filtro]);
  Future<ResponseCrud<T>> save(MapStringOr map);
  Future<ResponseCrud<void>> deleteId(String id);
}

class ResponseCrud<T> {
  final int rowsAfecteds;
  final int limit;
  final int offset;
  final T data;

  ResponseCrud(
    this.data, {
    required this.rowsAfecteds,
    this.limit = 0,
    this.offset = 1,
  });

  T get getData => data;
  int get getlimit => limit;
  int get getOffset => offset;
  int get getRowsAfecteds => rowsAfecteds;
}
