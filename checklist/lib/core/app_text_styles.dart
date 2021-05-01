import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle tituloAzul = TextStyle(
    color: AppColors.azul,
    fontSize: 19,
    fontFamily: 'Futura Bold',
  );

  static final TextStyle tituloCinza = TextStyle(
    color: AppColors.cinza,
    fontSize: 18,
    fontFamily: 'Futura Bold',
  );

  static final TextStyle subtituloCinza = TextStyle(
    color: AppColors.cinza,
    fontSize: 14,
    fontFamily: 'Futura Bold',
  );

  static final TextStyle texto = GoogleFonts.lato(
    color: AppColors.cinzaEscuro,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle texto11 = GoogleFonts.lato(
    color: AppColors.cinzaEscuro,
    fontSize: 11,
    fontWeight: FontWeight.normal,
  );
}
