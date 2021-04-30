import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color.fromRGBO(205, 207, 208, 1),
    Color.fromRGBO(220, 221, 222, 0.695),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));

  static final linearCaixa = LinearGradient(colors: [
    Color.fromRGBO(39, 129, 186, 1),
    Color.fromRGBO(40, 112, 169, 1),
    Color.fromRGBO(41, 109, 164, 1),
  ], stops: [
    0.0,
    0.8,
    1.0
  ], transform: GradientRotation(2.13959913 * pi));
}
