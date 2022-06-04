import 'package:flutter/material.dart';
import 'package:mini_g/theme/theme_constant.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final Text firstText;
  final Text secondText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: MiniG.sizeS,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: firstText),
          Flexible(
            child: secondText,
          )
        ],
      ),
    );
  }
}
