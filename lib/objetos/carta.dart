

class Carta {
  const Carta({this.id, this.titulo, this.detalhe});
  final int id;
  final String titulo;
  final String detalhe;
  // final String url;

  factory Carta.fromJson(Map<String, dynamic> json) => new Carta(
      id: json["id"], titulo: json["titulo"], detalhe: json["detalhe"]);
  Map<String, dynamic> toJson() =>
      {"id": id, "titulo": titulo, "detalhe": detalhe};
}
