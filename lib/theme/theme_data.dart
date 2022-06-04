import 'package:flutter/material.dart';

import 'theme_constant.dart';

/// getter for theme app mini G
ThemeData get baseTheme {
  return ThemeData(
    unselectedWidgetColor: MiniG.unselectedColor,
    primaryColor: MiniG.greenPrimary,
    primarySwatch: const MaterialColor(MiniG.greenPrimaryInt, {
      50: MiniG.greenPrimary,
      100: MiniG.greenPrimary,
      200: MiniG.greenPrimary,
      300: MiniG.greenPrimary,
      400: MiniG.greenPrimary,
      500: MiniG.greenPrimary,
      600: MiniG.greenPrimary,
      700: MiniG.greenPrimary,
      800: MiniG.greenPrimary,
      900: MiniG.greenPrimary,
    }),
    fontFamily: MiniG.fontFamilly,
    disabledColor: MiniG.lightPrimary,
    textTheme: _textTheme,
    cardTheme: _cardTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textButtonTheme: _textThemeButton,
  );
}

TextButtonThemeData get _textThemeButton {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}

InputDecorationTheme get _inputDecorationTheme {
  return InputDecorationTheme(
    filled: true,
    fillColor: MiniG.white,
    hintStyle: TextStyle(
      fontSize: 13,
      color: MiniG.blackPrimary.withOpacity(0.5),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: MiniG.sizeS,
    ),
    border: OutlineInputBorder(
      borderRadius: MiniG.borderRadius,
      borderSide: BorderSide.none,
    ),
  );
}

/// getter for card theme
CardTheme get _cardTheme {
  return CardTheme(
    elevation: 10,
    shadowColor: MiniG.lightPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(MiniG.radius),
    ),
  );
}

/// getters for button theme
ElevatedButtonThemeData get _elevatedButtonTheme {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(
        MiniG.elevation,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MiniG.radius),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return MiniG.unselectedColor;
          }

          return MiniG.greenPrimary;
        },
      ),
    ),
  );
}

/// getters for text theme global
TextTheme get _textTheme {
  return const TextTheme(
    headline1: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: MiniG.blackPrimary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: MiniG.blackPrimary,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: MiniG.blackPrimary,
      fontSize: 13,
      fontWeight: FontWeight.normal,
    ),
    caption: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: MiniG.blackPrimary,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );
}
