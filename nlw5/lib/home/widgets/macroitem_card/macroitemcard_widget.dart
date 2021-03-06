import 'package:checklist/core/app_colors.dart';
import 'package:checklist/core/app_images.dart';
import 'package:checklist/core/app_text_styles.dart';
import 'package:checklist/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MacroitemCardWidget extends StatelessWidget {
  final String title;
  final int completed;
  final int total;
  final VoidCallback onTap;

  const MacroitemCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.total,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.border),
            ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "$completed de $total",
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ProgressIndicatorWidget(value: completed / total),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
