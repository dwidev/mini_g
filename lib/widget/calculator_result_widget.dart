import 'package:flutter/material.dart';

import '../theme/theme_constant.dart';

class CalculatorResultWidet extends StatelessWidget {
  final String result;
  final bool isActive;

  const CalculatorResultWidet({
    Key? key,
    required this.result,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);
    return Text(
      result,
      style: textTheme.headline1?.copyWith(
        fontSize: 50,
        color: isActive ? MiniG.blackPrimary : MiniG.unselectedColor,
      ),
      overflow: TextOverflow.clip,
    );
  }
}
