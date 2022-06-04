import 'package:flutter/material.dart';

import '../theme/theme_constant.dart';

class CircleButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const CircleButtonWidget({
    Key? key,
    required this.icon,
    this.onPressed,
    this.iconColor = Colors.white,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: onPressed != null ? MiniG.defaultGradient : null,
        color: onPressed != null ? null : MiniG.unselectedColor,
        shape: BoxShape.circle,
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: MiniG.borderRadius,
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(2),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
