import 'package:checklist/core/app_text_styles.dart';
import 'package:checklist/core/core.dart';
import 'package:checklist/home/widgets/score_card/scorecard_widget.dart';
import 'package:checklist/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: AppColors.azulCaixa),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: user.name, style: AppTextStyles.titleBold)
                          ])),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(user.photoUrl))),
                      )
                    ],
                  ),
                ),
                Align(alignment: Alignment(0.0, 1.1), child: ScoreCardWidget())
              ],
            ),
          ),
        );
}
