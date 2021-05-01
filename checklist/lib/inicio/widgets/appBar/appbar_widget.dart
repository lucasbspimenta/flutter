import 'package:checklist/core/app_colors.dart';
import 'package:checklist/core/core.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  @override
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            top: true,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.maxFinite,
              decoration: BoxDecoration(color: AppColors.azul, boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1))
              ]),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.caixaBrancoLaranja,
                  ),
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/65264503?v=4'))),
                  )
                ],
              ),
            ),
          ),
        );
}
