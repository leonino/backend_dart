import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:mysql_client/mysql_client.dart';

import '../utils/custom_typedef.dart';

class DbMySQL {
  static final db = MySQLConnectionPool(
    host: "localhost",
    port: 3306,
    userName: "root",
    password: "qwe123",
    databaseName: "automacao",
    maxConnections: 15,
  );

  static String md5(String input) {
    return crypto.md5.convert(utf8.encode(input)).toString();
  }

  executeSQL(String sql) {}

  static String saveSQL(MapStringOr map, String nomeTabela,
      [String keyId = "id"]) {
    String _sql = "";
    String? id = map[keyId];
    bool _isInsert = (id == null || id.isEmpty);
    map.remove(keyId);

    if (_isInsert) {
      final f = compositionList(map.keys.toList());
      final v = compositionList(map.values.toList(), "'", "','", "'");
      _sql = "INSERT INTO $nomeTabela ($f) VALUES ($v)";
    } else {
      final set = compositionMap(map);
      _sql = "UPDATE $nomeTabela SET $set WHERE $keyId = '$id'";
    }
    return _sql;
  }

  static String compositionList(List lista,
      [String inicio = "", String meio = ",", String fim = ""]) {
    String result = lista.map((e) => e.toString()).reduce((comp, value) {
      return comp = "$comp$meio$value";
    });
    return "$inicio$result$fim";
  }

  static String compositionMap(MapStringOr map) {
    String result = "";
    for (var key in map.keys) {
      result += (result.isEmpty) ? "" : ", ";
      switch (map[key].runtimeType) {
        case String:
          result += key.toString() + "='" + map[key].toString() + "'";
          break;
        default:
          result += key.toString() + "=" + map[key].toString();
      }
    }
    return result;
  }
}



// pool = MySQLConnectionPool(
//           host: host,
//           port: 3306,
//           userName: "root",
//           password: "qwe123",
//           databaseName: "automacao", maxConnections: 10,
/*
  // Create a table
  await conn.query(
      'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');

  // Insert some data
  var result = await conn.query(
      'insert into users (name, email, age) values (?, ?, ?)',
      ['Bob', 'bob@bob.com', 25]);
  print('Inserted row id=${result.insertId}');

  // Query the database using a parameterized query
  var results = await conn.query(
      'select name, email, age from users where id = ?', [result.insertId]);
  for (var row in results) {
    print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  }

  // Update some data
  await conn.query('update users set age=? where name=?', [26, 'Bob']);

  // Query again database using a parameterized query
  var results2 = await conn.query(
      'select name, email, age from users where id = ?', [result.insertId]);
  for (var row in results2) {
    print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  }

  // Finally, close the connection
  await conn.close();
}
*/
