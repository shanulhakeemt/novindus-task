import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';

enum FontWeightType { three, four, five, six }

TextStyle getTextStylePoppins(
    {FontWeightType weight = FontWeightType.five,
    required double width,
    Color color = Pallete.textColor}) {
  switch (weight) {
    case FontWeightType.three:
      return GoogleFonts.poppins(
          color: color, fontSize: width, fontWeight: FontWeight.w300);

    case FontWeightType.four:
      return GoogleFonts.poppins(
          fontWeight: FontWeight.w400, color: color, fontSize: width);

    case FontWeightType.five:
      return GoogleFonts.poppins(
          fontWeight: FontWeight.w500, color: color, fontSize: width);
    case FontWeightType.six:
      return GoogleFonts.poppins(
          fontWeight: FontWeight.w600, color: color, fontSize: width);
  }
}
