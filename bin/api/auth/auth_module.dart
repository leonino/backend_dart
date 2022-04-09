import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../infra/i_mysql_datasource.dart';
import 'auth_store.dart';

class AuthModule {
  final IDataSource dataSource;

  AuthModule(this.dataSource);

  Handler get handler {
    var router = Router();

    router.get('/login', (Request req) async {
      var result = await req.readAsString();
      var map = jsonDecode(result) as Map<String, dynamic>;
      var resp = await AuthStore()
          .loginByUsuarioAndSenha(map["user"], map["password"]);
      return (resp)
          ? Response.ok("Login realizado com sucesso!")
          : Response.notFound("Usuário não existe!");
    });

    return router;
  }
}
