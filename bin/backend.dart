import 'package:shelf/shelf.dart';
import 'api/Auth/auth_module.dart';
import 'api/empresa/empresa_module.dart';
import 'api/pessoa/pessoa_module.dart';
import 'infra/custom_server.dart';
import 'utils/utils.dart';

void main() async {
  CustomEnv.fromFile((kDebugMode) ? '.env.dev' : '.env');

  final server = CustomServer();

  var router = Cascade()
      .add(
        AuthModule().handler,
      )
      .add(
        EmpresaModule().handler,
      )
      .add(
        PessoaModule().handler,
      )
      .handler;

  var handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  await server.initialize(handler);
}
