import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../infra/i_mysql_datasource.dart';

class EmpresaModule {
  final IDataSource dataSource;

  EmpresaModule(this.dataSource);
  Handler get handler {
    var router = Router();

    router.get('/empresa', (Request req) {
      return Response.ok("Modulo Empresa");
    });

    return router;
  }
}
