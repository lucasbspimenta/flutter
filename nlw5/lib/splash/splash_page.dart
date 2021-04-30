import 'package:checklist/core/app_gradients.dart';
import 'package:checklist/core/app_images.dart';
import 'package:checklist/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2))
          .then((_) => Navigator.pushReplacement(
                context2,
                MaterialPageRoute(builder: (context) => HomePage()),
              ));
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linearCaixa,
        ),
        child: Center(
            child: Image.asset(
          AppImages.logo,
          width: 150,
        )),
      ),
    );
  }
}
