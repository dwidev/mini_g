import 'package:flutter/material.dart';

import '../../../theme/theme_constant.dart';

class OnBoardingView extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnBoardingView({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return Container(
      width: size.width,
      height: size.height,
      color: MiniG.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: MiniG.sizeXXL),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: MiniG.sizeML),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headline1,
                ),
                const SizedBox(height: MiniG.sizeSS),
                Text(
                  description,
                  style: textTheme.bodyText1,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          const SizedBox(height: MiniG.sizeXXL),
        ],
      ),
    );
  }
}
