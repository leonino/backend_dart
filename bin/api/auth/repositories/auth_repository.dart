import '../../../infra/db_my_sql.dart';
import '../../models/usuario_model.dart';

class AuthRepository {
  final pool = DbMySQL.db;

  // Usuário Ativo
  // Senha Cripto MD5
  Future<UsuarioModel> getUsuarioByLoginAndSenha(
      {required String usuario, required String senha}) async {
    var sql =
        "SELECT * FROM :tabela WHERE ativo and login = ':usuario' and senha = ':senha'";
    var result = await pool.execute(sql, {
      "tabela": UsuarioModel.tabela,
      "usuario": usuario,
      "senha": DbMySQL.md5(senha),
    });
    var resp = result.rows.first.assoc();
    var user = UsuarioModel.fromMap(resp);
    return user;
  }
}

// SELECT a.*, b.*, c.*, d.* FROM padrao_usuario a
// inner join padrao_empresa b on(a.empresa_id = b.id)
// inner join padrao_pessoa c on(a.empresa_id = c.id)
// inner join padrao_local d on(a.empresa_id = d.id)
// WHERE login = 'admin' and senha = 'f6fdffe48c908deb0f4c3bd36c032e72'
