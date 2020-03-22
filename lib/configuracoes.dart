import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:myplanningpoker/main.dart';
import 'persistencia/configuracoesdb.dart';
import 'objetos/configuracoes.dart';

class ConfiguracoesPage extends StatelessWidget {
  final Configuracoes configuracoes;
  ConfiguracoesPage({this.configuracoes});
  Widget build(BuildContext context) {
    Configuracoes _configuracoes = this.configuracoes;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Configurações"),
        ),
        body: ListView(children: <Widget>[
          new GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  child: new Dialog(
                    child: Container(
                      height: 260,
                      child: MaterialColorPicker(
                          onlyShadeSelection: true,
                          selectedColor: _configuracoes.colorCorFundo,
                          onColorChange: (color) {
                            var rgb =
                                "${color.red},${color.green},${color.blue}";
                            Future<dynamic> configs =
                                ConfiguracoesDB.getConfiguracoes();
                            configs.then((c) {
                              Configuracoes configuracoes = c;
                              configuracoes.corFundo = rgb;
                              _configuracoes = new Configuracoes(
                                  configuracoes.corCarta,
                                  configuracoes.corFundo,
                                  configuracoes.corFonte);
                              ConfiguracoesDB.update(configuracoes);
                              Navigator.pop(context, color);
                            });
                          }),
                    ),
                  ));
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              elevation: 1,
              child: Container(
                height: 50,
                child: ListTile(
                    title: Text(
                  "Cor do fundo",
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  child: new Dialog(
                    child: Container(
                      height: 260,
                      child: MaterialColorPicker(
                        onlyShadeSelection: true,
                        onColorChange: (color) {
                          var rgb = "${color.red},${color.green},${color.blue}";
                          Future<dynamic> configs =
                              ConfiguracoesDB.getConfiguracoes();
                          configs.then((c) {
                            Configuracoes configuracoes = c;
                            configuracoes.corCarta = rgb;
                            _configuracoes = new Configuracoes(
                                configuracoes.corCarta,
                                configuracoes.corFundo,
                                configuracoes.corFonte);
                            ConfiguracoesDB.update(configuracoes);
                            Navigator.pop(context, color);
                          });
                        },
                        selectedColor: _configuracoes.colorCorCarta,
                      ),
                    ),
                  ));
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              elevation: 1,
              child: Container(
                height: 50,
                child: ListTile(
                    title: Text(
                  "Cor das cartas",
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  child: new Dialog(
                    child: Container(
                      height: 260,
                      child: MaterialColorPicker(
                        onlyShadeSelection: true,
                        onColorChange: (color) {
                          var rgb = "${color.red},${color.green},${color.blue}";
                          Future<dynamic> configs =
                              ConfiguracoesDB.getConfiguracoes();
                          configs.then((c) {
                            Configuracoes configuracoes = c;
                            configuracoes.corFonte = rgb;

                            _configuracoes = new Configuracoes(
                                configuracoes.corCarta,
                                configuracoes.corFundo,
                                configuracoes.corFonte);

                            ConfiguracoesDB.update(configuracoes);
                            Navigator.pop(context, color);
                          });
                        },
                        selectedColor: _configuracoes.colorCorFonte,
                      ),
                    ),
                  ));
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              elevation: 1,
              child: Container(
                height: 50,
                child: ListTile(
                    title: Text(
                  "Cor do texto",
                  style: TextStyle(fontSize: 18),
                )),
              ),
            ),
          ),
        ]));
  }
}
