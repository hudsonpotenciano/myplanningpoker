import 'dart:ui';

class Configuracoes {
  Configuracoes(String carta, String fundo, String fonte) {
    this.corCarta = carta;
    this.corFundo = fundo;
    this.corFonte = fonte;

    List<String> corFundoSplit =
        corFundo != "" ? corFundo.split(",") : ["240", "240", "240"];
    colorCorFundo = Color.fromRGBO(int.parse(corFundoSplit[0]),
        int.parse(corFundoSplit[1]), int.parse(corFundoSplit[2]), 1);

    List<String> corCartaSplit =
        corCarta != "" ? corCarta.split(",") : ["255", "255", "255"];
    colorCorCarta = Color.fromRGBO(int.parse(corCartaSplit[0]),
        int.parse(corCartaSplit[1]), int.parse(corCartaSplit[2]), 1);

    List<String> corFonteSplit =
        corFonte != "" ? corFonte.split(",") : ["0", "0", "0"];
    colorCorFonte = Color.fromRGBO(int.parse(corFonteSplit[0]),
        int.parse(corFonteSplit[1]), int.parse(corFonteSplit[2]), 1);
  }

  String corCarta;
  String corFundo;
  String corFonte;
  Color colorCorCarta;
  Color colorCorFundo;
  Color colorCorFonte;

  factory Configuracoes.fromJson(Map<String, dynamic> json) =>
      new Configuracoes(json["corcarta"], json["corfundo"], json["corfonte"]);
  Map<String, dynamic> toJson() =>
      {"corcarta": corCarta, "corfundo": corFundo, "corfonte": corFonte};
}
