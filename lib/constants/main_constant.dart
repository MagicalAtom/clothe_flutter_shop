import 'package:flutter/material.dart';




class MainConstant {
  static Color MainColor = Color(0xff111111);
  static Color SecondColor = Color(0xff1B2028);
  static Color DarkBrown = Color(0xff292526);
  static Color LightGray = Color(0xffA4AAAD);
  static Color NormalGray = Color(0xff878787);
  static Color White = Color(0xffffffff);
  static Color Yellow = Color(0xffffd33c);
  static double borderRadius = 12;
  static double paddingHorizon = 24;


  final InputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide:  const BorderSide(
      color: Color(0xff878787),
    )
  );

}

