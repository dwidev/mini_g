import 'package:flutter/material.dart';

import '../../../theme/theme_constant.dart';

class ContinerBoxTransaction extends StatelessWidget {
  const ContinerBoxTransaction({
    Key? key,
    required this.title,
    required this.description,
    required this.child,
  }) : super(key: key);

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);
    return Container(
      margin: const EdgeInsets.only(top: MiniG.sizeS),
      width: size.width,
      padding: const EdgeInsets.all(MiniG.sizeM),
      color: MiniG.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: textTheme.bodyText1,
            overflow: TextOverflow.clip,
          ),
          const SizedBox(height: MiniG.sizeS),
          const Divider(color: MiniG.unselectedColor, thickness: 1),
          child,
        ],
      ),
    );
  }
}
