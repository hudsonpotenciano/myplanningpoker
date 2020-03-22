import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:myplanningpoker/objetos/configuracoes.dart';
import 'objetos/carta.dart';

class DetalhesPage extends StatelessWidget {
  @override
  DetalhesPage({this.carta, this.configs});

  final Carta carta;
  final Configuracoes configs;

  Widget build(BuildContext context) {
    double tamanhoTexto = 0;
    switch (carta.titulo.length) {
      case 1:
        {
          tamanhoTexto = 300;
        }
        break;
      case 2:
        {
          tamanhoTexto = 200;
        }
        break;
      case 3:
        {
          tamanhoTexto = 150;
        }
        break;
      default:
        {
          tamanhoTexto = 150;
        }
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: configs.colorCorFundo,
        appBar: AppBar(
            // title: Text(carta.titulo),
            ),
        body: FlipCard(
          direction: FlipDirection.HORIZONTAL, // default
          front: Center(
            child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(12),
                color: configs.colorCorFonte,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                  widthFactor: 0.8,
                )),
          ),
          back: Center(
            child: Card(
              color: configs.colorCorCarta,
              child: FractionallySizedBox(
                  heightFactor: 0.8,
                  widthFactor: 0.8,
                  child: Center(
                    child: carta.id == 13
                        ? Icon(
                            Icons.free_breakfast,
                            size: 210,
                            color: configs.colorCorFonte,
                          )
                        : Text(
                            carta.detalhe,
                            style: TextStyle(
                                letterSpacing: 8,
                                color: configs.colorCorFonte,
                                // shadows: [
                                //   Shadow(
                                //       offset: Offset(0, 3),
                                //       color: Colors.lightBlue[900])
                                // ],
                                // fontFamily: 'indigo',
                                fontWeight: FontWeight.w900,
                                fontSize: tamanhoTexto),
                            textAlign: TextAlign.center,
                          ),
                  )),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(12),
            ),
          ),
        ));
  }
}
