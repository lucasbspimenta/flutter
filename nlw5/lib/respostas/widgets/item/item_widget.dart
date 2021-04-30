import 'package:checklist/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.access_alarm),
      title: Text("Jardim", style: AppTextStyles.heading15),
      backgroundColor: Colors.grey[50],
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Texto ajuda do jardim"))
      ],
    );
  }
}
