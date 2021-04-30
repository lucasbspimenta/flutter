import 'package:checklist/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });

  NextButtonWidget.green({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.darkGreen,
        this.textColor = AppColors.white,
        this.borderColor = AppColors.darkGreen,
        this.onTap = onTap,
        this.label = label;
  NextButtonWidget.white({
    required String label,
    required VoidCallback onTap,
  })   : this.backgroundColor = AppColors.white,
        this.textColor = AppColors.black,
        this.borderColor = AppColors.border,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: borderColor,
              ),
            ),
            overlayColor: MaterialStateProperty.all(AppColors.azulCaixa)),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 15, color: textColor),
        ),
      ),
    );
  }
}
