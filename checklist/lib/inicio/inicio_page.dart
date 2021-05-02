import 'package:checklist/database.dart';
import 'package:flutter/material.dart';

import 'inicio_controller.dart';
import 'widgets/appBar/appbar_widget.dart';

class InicioPage extends StatefulWidget {
  final AppDatabase? database;
  const InicioPage({Key? key, this.database}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final controller = InicioController();

  @override
  void initState() {
    super.initState();

    controller.getUsuario(widget.database?.usuarioDao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usuario: controller.usuario,
      ),
    );
  }
}
