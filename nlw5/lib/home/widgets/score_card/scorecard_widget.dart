import 'package:checklist/core/app_colors.dart';
import 'package:checklist/core/app_text_styles.dart';
import 'package:checklist/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0.1,
                  blurRadius: 1,
                  offset: Offset(0, 1))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: ChartWidget()),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Ag. São Sebastião do Paraíso",
                          style: AppTextStyles.heading,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              height: 15, width: 15, color: Colors.lightGreen),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Agendamento Clássico",
                                style: AppTextStyles.body),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
