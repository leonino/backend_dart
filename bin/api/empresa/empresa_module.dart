import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class EmpresaModule {
  Handler get handler {
    var router = Router();

    router.get('/empresa', (Request req) {
      return Response.ok("Modulo Empresa");
    });

    return router;
  }
}
