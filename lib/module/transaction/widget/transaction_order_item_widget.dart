import 'package:flutter/material.dart';

import '../../../functions/money_converters.dart';
import '../../../theme/theme_constant.dart';
import '../../home/model/menu_item_model.dart';

class TransactionOrderItemWidget extends StatelessWidget {
  const TransactionOrderItemWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final MenuItemModel menu;

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Container(
      margin: const EdgeInsets.only(bottom: MiniG.sizeMS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(menu.name),
              Text(
                moneyConverters(menu.price),
                style: textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            menu.amount.toString(),
            style: textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
