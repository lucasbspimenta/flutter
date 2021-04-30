import 'package:checklist/challenge/challenge_page.dart';
import 'package:checklist/home/home_controller.dart';
import 'package:checklist/home/home_state.dart';
import 'package:checklist/home/widgets/appbar/appbar_widget.dart';
import 'package:checklist/home/widgets/filtros/filtros_widget.dart';
import 'package:checklist/home/widgets/macroitem_card/macroitemcard_widget.dart';
import 'package:checklist/splash/splash_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FiltroWidget(
                    label: "Todos",
                  ),
                  FiltroWidget(
                    label: "Pendentes",
                  ),
                  FiltroWidget(
                    label: "Concluídos",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children:
                      /* [
                    MacroitemCardWidget(
                      title: "Teste",
                      total: 2,
                      completed: 1,
                    )
                  ]*/
                      controller.quizzes!
                          .map((e) => MacroitemCardWidget(
                                title: e.title,
                                completed: e.questionAnswered,
                                total: e.questions.length,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChallengePage(
                                                questions: e.questions,
                                              )));
                                },
                              ))
                          .toList(),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return SplashPage();
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
