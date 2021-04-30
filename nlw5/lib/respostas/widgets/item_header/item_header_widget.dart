import 'package:checklist/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ItemHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.access_alarm),
        title: Text(
          "Jardim",
          textAlign: TextAlign.left,
          style: AppTextStyles.heading15,
        ));
  }
}
