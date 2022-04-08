import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'api/auth/auth_module.dart';
import 'api/auth/auth_store.dart';

class SeverHandler {
  Handler get nandler {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok("Rota principal");
    });
    router.get('/auth', (Request req) async {
      var res = await req.readAsString();
      var json = jsonDecode(res) as Map<String, dynamic>;
      var result = await AuthStore()
          .loginByUsuarioAndSenha(json["user"]!, json["password"]!);
      (result) ? Response.ok("Usuario Authenticado") : Response(400);
    });

    return router;
  }
}
