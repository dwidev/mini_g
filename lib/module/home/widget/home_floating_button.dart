import 'package:flutter/material.dart';
import 'package:mini_g/functions/money_converters.dart';
import 'package:mini_g/module/home/model/menu_item_model.dart';

import '../../../theme/theme_constant.dart';
import '../../../widget/minig_button_widget.dart';

class HomeFloatingButton extends StatelessWidget {
  final List<MenuItemModel> listTransaction;
  final VoidCallback onPressed;
  final VoidCallback onResetTransaction;

  const HomeFloatingButton({
    Key? key,
    required this.listTransaction,
    required this.onPressed,
    required this.onResetTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: Center(
        child: Column(
          children: [
            MiniGButtonWidget(
              width: size.width / 2,
              onPressed: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: MiniG.sizeSS),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${listTransaction.getTotalItems} items"),
                    Text(
                      moneyConverters(listTransaction.getTotalPrice),
                      style: textTheme.bodyText1?.copyWith(
                        color: MiniG.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MiniG.sizeSS),
            TextButton(
              onPressed: () {
                onResetTransaction();
              },
              child: Text(
                "Batalkan transaksi",
                style: textTheme.bodyText1?.copyWith(
                  color: MiniG.redPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: MiniG.sizeSS),
          ],
        ),
      ),
    );
  }
}
