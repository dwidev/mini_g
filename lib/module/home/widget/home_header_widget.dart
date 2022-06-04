import 'package:flutter/material.dart';
import 'package:mini_g/constant/image_assets.dart';
import 'package:mini_g/functions/money_converters.dart';
import 'package:mini_g/theme/theme_constant.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    required this.saldo,
    required this.topPadding,
    Key? key,
  }) : super(key: key);

  final double saldo;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return Container(
      width: size.width,
      height: size.height / 3,
      decoration: const BoxDecoration(
        gradient: MiniG.topToBottomGradient,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -20,
            child: Image.asset(
              homeOverlay,
              width: 200,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: topPadding),
            padding: const EdgeInsets.symmetric(horizontal: MiniG.sizeM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: MiniG.unselectedColor,
                  backgroundImage: AssetImage(
                    profile,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Saldo toko anda",
                      style: textTheme.bodyText1?.copyWith(
                        color: MiniG.white,
                      ),
                    ),
                    Text(
                      moneyConverters(saldo),
                      style: textTheme.headline1?.copyWith(
                        color: MiniG.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
