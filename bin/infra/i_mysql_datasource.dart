import '../utils/custom_typedef.dart';

abstract class IDataSource {
  Future<List<MapStringOr>> query(String sql);
  //Future<Iterable<MapStringOr>> prepare(String sql);
  //Future<Iterable<MapStringOr>> stmt(String sql);
}
