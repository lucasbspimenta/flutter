import 'package:checklist/core/core.dart';
import 'package:flutter/material.dart';

import 'splash_controller.dart';
import 'splash_state.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();

  @override
  void initState() {
    super.initState();

    controller.mensagensCarregandoNotifier.addListener(() {
      setState(() {});
    });

    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    controller.verificaConexao();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == SplashState.loading) {
      return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 100),
            decoration: BoxDecoration(
              color: AppColors.cinzaClaro,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Image.asset(
                  AppImages.logo,
                  width: 250,
                )),
                CircularProgressIndicator(),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        controller.mensagensCarregando,
                        style: AppTextStyles.texto,
                      ),
                    )),
              ],
            )),
      );
    } else {
      return Text('Terminei de carregar');
    }
  }
}
