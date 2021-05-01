import 'package:checklist/inicio/inicio_page.dart';
import 'package:checklist/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppWidget extends StatelessWidget {
  Future _abrirCaixa() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return await Hive.openBox('minhaCaixa');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Checklist",
        home: FutureBuilder(
          future: _abrirCaixa(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Scaffold(
                  body: Center(
                    child: Text('Algo deu errado :('),
                  ),
                );
              } else {
                return InicioPage();
              }
            } else {
              return SplashPage();
            }
          },
        )
        //home: SplashPage(),
        );
  }
}
