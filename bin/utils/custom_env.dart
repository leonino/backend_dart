import 'dart:io';
import 'parser_extension.dart';

typedef MapEnv = Map<String, String>;

class CustomEnv {
  static MapEnv _mapEnv = {};
  static String _file = '.env';

  CustomEnv._();

  factory CustomEnv.fromFile(String filename) {
    _file = filename;
    return CustomEnv._();
  }

  static Future<T> get<T>({required String key, T? defaul}) async {
    T value;
    await _load();
    if (_mapEnv.containsKey(key)) {
      value = _mapEnv[key]!.toType(T);
    } else {
      value = defaul ?? "".toType(T);
    }
    return value;
  }

  static Future<void> _load() async {
    var isExist = await File(_file).exists();
    if (!isExist) {
      await File(_file).create();
    }
    _mapEnv = await _readFile();
  }

  static Future<MapEnv> _readFile() async {
    MapEnv map = {};
    var buffer = await File(_file).readAsString();
    if (buffer.isNotEmpty) {
      var linhas = buffer.split('\n');
      for (var linha in linhas) {
        if (linha.contains("=")) {
          var k = linha.split('=')[0];
          var v = linha.split('=')[1];
          map.putIfAbsent(k, () => v);
        }
      }
    }
    return map;
  }
}
