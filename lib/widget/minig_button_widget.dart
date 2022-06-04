import 'package:flutter/material.dart';

import '../theme/theme_constant.dart';

class MiniGButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double width, height;
  final bool isWitdhAuto, noGradient;
  final Color color;

  const MiniGButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width = 100,
    this.height = 40.0,
    this.isWitdhAuto = false,
    this.noGradient = false,
    this.color = MiniG.white,
  }) : super(key: key);

  factory MiniGButtonWidget.noGradient({
    required VoidCallback onPressed,
    required Widget child,
    double width = 100,
    double height = 40,
    Color color = MiniG.white,
    bool isWitdhAuto = false,
  }) {
    return MiniGButtonWidget(
      onPressed: onPressed,
      child: child,
      width: width,
      height: height,
      noGradient: true,
      color: color,
      isWitdhAuto: isWitdhAuto,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        elevation: noGradient ? 0 : 5,
        primary: noGradient ? color : Colors.transparent,
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: !noGradient ? MiniG.defaultGradient : null,
          borderRadius: MiniG.borderRadius,
        ),
        child: Container(
          width: !isWitdhAuto ? width : null,
          // height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(minWidth: 88.0),
          child: child,
        ),
      ),
    );
  }
}
