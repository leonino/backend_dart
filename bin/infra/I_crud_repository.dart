import 'db_my_sql.dart';
import 'i_model.dart';

abstract class ICrudRepository<T extends IModel> {
  static final pool = DbMySQL.db;

  Future<ResponseCrud<T>> findById(String id);
  Future<ResponseCrud<List<T>>> findAll([String? filtro]);
  Future<ResponseCrud<T>> updateById(T model);
  Future<ResponseCrud<T>> deleteId(String id);
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
