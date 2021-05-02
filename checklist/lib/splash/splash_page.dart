import 'package:checklist/core/core.dart';
import 'package:checklist/inicio/inicio_page.dart';
import 'package:checklist/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.getDatabase();
    controller.getPermissoes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    controller.mensagensCarregandoNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != SplashState.success) {
      return Scaffold(
        backgroundColor: AppColors.cinzaClaro,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Container(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(controller.mensagensCarregando),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return InicioPage(
        database: controller.database,
      );
      /*Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );*/
    }
  }
}
