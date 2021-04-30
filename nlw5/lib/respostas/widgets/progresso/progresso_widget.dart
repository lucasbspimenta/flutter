import 'package:checklist/core/app_text_styles.dart';
import 'package:checklist/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class ProgressoWidget extends StatelessWidget {
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
                "Fachada",
                style: AppTextStyles.body,
              ),
              Text(
                "X itens concluídos",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: 0.3),
        ],
      ),
    );
  }
}
