import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import '../utils/custom_env.dart';

class CustomServer {
  static String _address = "localhost";
  static int _port = 8080;

  CustomServer();

  Future<void> initialize(Handler handler, {String? address, int? port}) async {
    _address = await CustomEnv.get<String>(
        key: 'server_address', defaul: address ?? _address);
    _port = await CustomEnv.get<int>(key: 'server_port', defaul: port ?? _port);

    await shelf_io.serve(handler, _address, _port);
    print('Serving at http://$_address:$_port');
  }
}
