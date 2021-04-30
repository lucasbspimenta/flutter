import 'package:checklist/respostas/widgets/item/item_widget.dart';
import 'package:checklist/respostas/widgets/progresso/progresso_widget.dart';
import 'package:flutter/material.dart';

class RespostasPage extends StatefulWidget {
  @override
  _RespostasPageState createState() => _RespostasPageState();
}

class _RespostasPageState extends State<RespostasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: ProgressoWidget()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          ItemWidget(),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ]),
      ),
    );
  }
}
