import 'package:flutter/material.dart';
import 'package:mini_g/functions/money_converters.dart';
import 'package:mini_g/module/home/model/menu_item_model.dart';
import 'package:mini_g/navigator/navigator.dart';
import 'package:mini_g/utils/minig_flashbar.dart';

import '../../../constant/icons_assets.dart';
import '../../../theme/theme_constant.dart';
import '../../../widget/minig_button_widget.dart';
import '../../../widget/row_text_widget.dart';
import '../model/transaction_model.dart';

void openSuccessTransactionPage({
  required BuildContext context,
  required TransactionModel transaction,
  required VoidCallback onResetTransaction,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (context) => _SuccessTransactionPage(
      transaction: transaction,
      onResetTransaction: onResetTransaction,
    ),
  );
}

class _SuccessTransactionPage extends StatelessWidget {
  const _SuccessTransactionPage({
    Key? key,
    required this.transaction,
    required this.onResetTransaction,
  }) : super(key: key);

  final TransactionModel transaction;
  final VoidCallback onResetTransaction;

  double get kembali =>
      transaction.bayar - transaction.listTransaction.getTotal;

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(MiniG.sizeM),
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            success,
            width: 100,
          ),
          const SizedBox(height: MiniG.sizeM),
          Text(
            "Transaksi berhasil disimpan",
            style: textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: MiniG.sizeM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "KSHDHS-12y823-12uy12327",
                style: textTheme.bodyText1,
              ),
              const SizedBox(width: 5),
              TextButton(
                onPressed: () {
                  showFlashBar(context: context, description: "Struk dicetak");
                },
                child: Text(
                  "Cetak struk",
                  style: textTheme.headline1?.copyWith(
                    fontSize: 18,
                    color: MiniG.redPrimary,
                  ),
                ),
              )
            ],
          ),
          const Divider(color: MiniG.unselectedColor, thickness: 1),
          RowTextWidget(
            firstText: const Text("Jumlah pesanan"),
            secondText: Text(
              transaction.listTransaction.getTotalItems.toString(),
            ),
          ),
          RowTextWidget(
            firstText: const Text("Sub total"),
            secondText: Text(
              moneyConverters(transaction.listTransaction.getTotalPrice),
            ),
          ),
          RowTextWidget(
            firstText: const Text("ppn (10%)"),
            secondText: Text(
              moneyConverters(transaction.listTransaction.getPpn),
            ),
          ),
          const SizedBox(height: MiniG.sizeS),
          const Divider(color: MiniG.unselectedColor, thickness: 1),
          RowTextWidget(
            firstText: const Text("Total"),
            secondText: Text(
              moneyConverters(transaction.listTransaction.getTotal),
            ),
          ),
          RowTextWidget(
            firstText: const Text("Bayar"),
            secondText: Text(
              moneyConverters(transaction.bayar),
            ),
          ),
          RowTextWidget(
            firstText: const Text("Kembali"),
            secondText: Text(
              moneyConverters(kembali),
            ),
          ),
          const SizedBox(height: MiniG.sizeM),
          MiniGButtonWidget(
            onPressed: () {
              pop(context: context);
              onResetTransaction();
            },
            child: const Text("Oke"),
          )
        ],
      ),
    );
  }
}
