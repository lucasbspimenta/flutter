import 'package:checklist/core/core.dart';
import 'package:checklist/inicio/inicio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1))
          .then((_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InicioPage()),
              ));
    });

    return Scaffold(
      body: Container(
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
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
