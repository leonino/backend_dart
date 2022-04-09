import '../utils/custom_typedef.dart';
import 'i_crud_repository.dart';

abstract class IDataSource {
  Future<ResponseSQL<List<MapStringOr>>> query({
    required String sql,
    String? filter,
    MapString? paginator,
  });
  //Future<Iterable<MapStringOr>> prepare(String sql);
  //Future<Iterable<MapStringOr>> stmt(String sql);
}
