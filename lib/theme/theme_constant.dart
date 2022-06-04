import 'package:flutter/material.dart';

/// class for constant color
abstract class MiniG {
  MiniG._();

  // font fammily
  static const String fontFamilly = "Poppins";

  // pading size
  static const double sizeSS = 5;
  static const double sizeS = 10;
  static const double sizeMS = 15;
  static const double sizeM = 20;
  static const double sizeML = 25;
  static const double sizeL = 30;
  static const double sizeXL = 40;
  static const double sizeXXL = 50;

  // style value
  static const double elevation = 10;
  static const double radius = 20;
  static BorderRadius borderRadius = BorderRadius.circular(20);

  // COLORS
  static const Color white = Colors.white;
  static const int greenPrimaryInt = 0xff02422F;
  static const Color greenPrimary = Color(greenPrimaryInt);
  static const Color greenSecondary = Color(0xff14C38E);
  static const Color blackPrimary = Color(0xff000000);
  static const Color lightPrimary = Color(0xffF8F8F8);
  static const Color bluePrimary = Color(0xff5273E9);
  static const Color unselectedColor = Color(0xffE8E8E8);
  static const Color unselectedColorText = Color(0xff5A5A5A);
  static const Color redPrimary = Color(0xffFF6F6F);

  // gradient
  static const LinearGradient defaultGradient = LinearGradient(
    colors: [
      MiniG.greenSecondary,
      MiniG.greenPrimary,
    ],
  );

  static const LinearGradient topToBottomGradient = LinearGradient(
    colors: [
      MiniG.greenPrimary,
      MiniG.greenSecondary,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const BoxShadow boxShadow = BoxShadow(
    blurRadius: 10,
    spreadRadius: 1,
    color: unselectedColor,
  );
}

// function for get size
Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

// function for get text theme
TextTheme getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

// function for get view padding
EdgeInsets getViewPadding(BuildContext context) {
  return MediaQuery.of(context).viewPadding;
}
