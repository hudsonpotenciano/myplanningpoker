import '../objetos/configuracoes.dart';
import '../persistencia/dbhelper.dart';

class ConfiguracoesDB {
  static update(Configuracoes config) async {
    final db = await DBProvider.db.database;
    var res = await db.update("Configuracoes", config.toJson());
    return res;
  }

  static getConfiguracoes() async {
    final db = await DBProvider.db.database;
    var res = await db.query("Configuracoes");
    return res.isNotEmpty ? Configuracoes.fromJson(res.first) : Null;
  }
}
