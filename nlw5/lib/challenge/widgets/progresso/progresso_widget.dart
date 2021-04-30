import 'package:checklist/core/app_text_styles.dart';
import 'package:checklist/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class ProgressoWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const ProgressoWidget(
      {Key? key, required this.currentPage, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "$length itens concluídos",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
