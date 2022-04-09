import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../infra/i_mysql_datasource.dart';

import '../../utils/custom_typedef.dart';
import '../models/pessoa_model.dart';
import 'repositories/pessoa_repository.dart';

class PessoaModule {
  final IDataSource dataSource;

  PessoaModule(this.dataSource);
  Handler get handler {
    var router = Router();
    var headers = {"Content-Type": "application/json"};

    router.get('/pessoas', (Request req) async {
      var repository = PessoaRepository(dataSource);
      var paginator = queryParams(req.url.query);
      print(paginator);
      var resp = await repository.findAll(paginator: paginator);
      var pessoas = resp.data.map((pessoa) => pessoa.toJson()).toList();
      var meta = resp.getPagination.toJson();
      var map = {
        "data": pessoas.toString(),
        "pagination": meta.toString(),
        "getRowsAfecteds": resp.getRowsAfecteds.toString(),
        "sql": resp.getSql,
      };
      return Response.ok(map.toString(), headers: headers);
    });

    router.get('/pessoas/<id>', (Request req) async {
      String? id = req.params['id'];
      var repository = PessoaRepository(dataSource);
      var resp = await repository.findById(id.toString());
      var pessoa = resp.data.toJson().toString();
      return Response.ok(pessoa, headers: headers);
    });

    router.post('/pessoas', (Request req) async {
      var result = await req.readAsString();
      var map = jsonDecode(result) as Map<String, dynamic>;
      var model = PessoaModel.fromMap(map);
      return Response.ok("Pessoa => ${model.id}, ${model.nmpessoa}");
    });

    return router;
  }

  MapString queryParams(String query) {
    MapString params = {};
    if (query.isNotEmpty) {
      var items =
          query.split("&").map((e) => {e.split('=')[0]: e.split('=')[1]});

      for (var map in items) {
        params.addAll(map);
      }
    }
    return params;
  }
}
