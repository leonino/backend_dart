import 'package:shelf/shelf.dart';
import 'api/Auth/auth_module.dart';
import 'api/empresa/empresa_module.dart';
import 'api/pessoa/pessoa_module.dart';
import 'infra/custom_server.dart';
import 'infra/mysql_datasource.dart';
import 'utils/custom_constante.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile((kDebugMode) ? '.env.dev' : '.env');
  final dataSource = MysqlDatasource();

  final server = CustomServer();

  var router = Cascade()
      .add(
        AuthModule(dataSource).handler,
      )
      .add(
        EmpresaModule(dataSource).handler,
      )
      .add(
        PessoaModule(dataSource).handler,
      )
      .handler;

  var handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  await server.initialize(handler);
}
