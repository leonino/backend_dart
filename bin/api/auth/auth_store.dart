import '../models/usuario_model.dart';
import '../auth/repositories/auth_repository.dart';

class AuthStore {
  UsuarioModel? _usuario;

  final repo = AuthRepository();

  set usuario(UsuarioModel? value) => _usuario = value;
  UsuarioModel get usuario => _usuario as UsuarioModel;

  bool get authenticed => _usuario != null && _usuario!.ativo;
  bool get notAuthenticed => !authenticed;

  Future<bool> loginByUsuarioAndSenha(String user, String password) async {
    usuario =
        await repo.getUsuarioByLoginAndSenha(usuario: user, senha: password);
    return authenticed;
  }
}
