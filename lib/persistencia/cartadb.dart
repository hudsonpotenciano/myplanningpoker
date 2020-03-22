import '../persistencia/dbhelper.dart';
import '../objetos/carta.dart';

class CartaDB {
  static newCartas(List<Carta> cartas) async {
    final db = await DBProvider.db.database;

    cartas.forEach((carta) async {
      await db.insert("Carta", carta.toJson());
    });
  }

  static newCarta(Carta carta) async {
    final db = await DBProvider.db.database;
    var res = await db.rawInsert("INSERT Into Carta (id,titulo,detalhe)"
        " VALUES (${carta.id},${carta.titulo},${carta.detalhe})");
    return res;
  }

  static getCarta(int id) async {
    final db = await DBProvider.db.database;
    var res = await db.query("Carta", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Carta.fromJson(res.first) : Null;
  }

  static Future<List<Carta>> getCartas() async {
    final db = await DBProvider.db.database;
    var res = await db.query("Carta");
    var cartas = new List<Carta>();

    if (res.length > 0) {
      res.forEach((r) {
        if (res.isNotEmpty) {
          cartas.add(Carta.fromJson(r));
        }
      });
    } else {
      cartas.addAll([
        Carta(id: 1, titulo: "0", detalhe: "0"),
        Carta(id: 2, titulo: "1/2", detalhe: "1/2"),
        Carta(id: 3, titulo: "1", detalhe: "1"),
        Carta(id: 4, titulo: "2", detalhe: "2"),
        Carta(id: 5, titulo: "3", detalhe: "3"),
        Carta(id: 6, titulo: "5", detalhe: "5"),
        Carta(id: 7, titulo: "8", detalhe: "8"),
        Carta(id: 8, titulo: "13", detalhe: "13"),
        Carta(id: 9, titulo: "20", detalhe: "20"),
        Carta(id: 10, titulo: "40", detalhe: "40"),
        Carta(id: 11, titulo: "100", detalhe: "1\n0\n0"),
        Carta(id: 12, titulo: "?", detalhe: "?"),
        Carta(id: 13, titulo: "", detalhe: "")
      ]);

      CartaDB.newCartas(cartas);
    }

    return cartas;
  }

  updateCarta(Carta carta) async {
    final db = await DBProvider.db.database;
    var res = await db.update("Carta", carta.toJson(),
        where: "id = ?", whereArgs: [carta.id]);
    return res;
  }
}
