import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/pessoa_model.dart';
import 'repositories/pessoa_repository.dart';

class PessoaModule {
  Handler get handler {
    var router = Router();

    router.get('/pessoas', (Request req) async {
      var repository = PessoaRepository();
      var resp = await repository.findAll();
      var pessoas = resp.data;
      return Response.ok(
          "Pessoa [${pessoas.length}] registros => ${pessoas[5].id}, nome: ${pessoas[5].nmpessoa}");
    });

    router.get('/pessoas/<id>', (Request req) async {
      String? id = req.params['id'];
      var repository = PessoaRepository();
      var resp = await repository.findById(id.toString());
      var pessoa = resp.data;
      return Response.ok("Pessoa => ${pessoa.id}, nome: ${pessoa.nmpessoa}");
    });

    router.post('/pessoas', (Request req) async {
      var result = await req.readAsString();
      var map = jsonDecode(result) as Map<String, dynamic>;
      var model = PessoaModel.fromMap(map);
      return Response.ok("Pessoa => ${model.id}, ${model.nmpessoa}");
    });

    return router;
  }
}
