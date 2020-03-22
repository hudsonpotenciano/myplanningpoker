import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myplanningpoker/objetos/configuracoes.dart';
import 'objetos/carta.dart';
import 'detalhes.dart';
import 'configuracoes.dart';
import 'persistencia/cartadb.dart';
import 'persistencia/configuracoesdb.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.black),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, configuracoes) {
        if (configuracoes.hasData) {
          Configuracoes config = configuracoes.data as Configuracoes;

          return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: config.colorCorFundo,
            body: Container(child: carregueGridCartas(config)),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ConfiguracoesPage(configuracoes: config)),
                );
              },
              child: Icon(Icons.settings),
            ),
          );
        }

        return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Carregando...", style: TextStyle(fontSize: 15)),
            ));
      },
      future: ConfiguracoesDB.getConfiguracoes(),
    );
  }

  Widget carregueGridCartas(Configuracoes configs) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.hasData) {
          return GridView.count(crossAxisCount: 2, children: projectSnap.data);
        }

        return Center(
          child: Text(
            "Carregando...",
            style: TextStyle(fontSize: 15),
          ),
        );
      },
      future: obtenhaListaCartas(configs),
    );
  }

  Future obtenhaListaCartas(Configuracoes configs) async {
    List<Carta> cartas = await CartaDB.getCartas();

    return List.generate(cartas.length, (index) {
      Carta carta = cartas[index];

      return Card(
        color: configs.colorCorCarta,
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetalhesPage(
                        carta: carta,
                        configs: configs,
                      )),
            );
          },
          child: Center(
              child: carta.id == 13
                  ? Icon(
                      Icons.free_breakfast,
                      size: 100,
                      color: configs.colorCorFonte,
                    )
                  : Container(
                      child: Text(
                        carta.titulo,
                        style: TextStyle(
                            letterSpacing: 8,
                            color: configs.colorCorFonte,
                            // shadows: [
                            //   Shadow(
                            //       offset: Offset(0, 3),
                            //       color: )
                            // ],
                            // fontFamily: 'indigo',
                            fontWeight: FontWeight.w900,
                            fontSize: 80),
                        textAlign: TextAlign.center,
                      ),
                    )),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(12),
      );
    });
  }
}
