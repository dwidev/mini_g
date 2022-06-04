import 'package:flutter/material.dart';
import 'package:mini_g/utils/minig_flashbar.dart';

import '../../../functions/money_converters.dart';
import '../../../navigator/navigator.dart';
import '../../../theme/theme_constant.dart';
import '../../../widget/calculator_widget.dart';
import '../../../widget/minig_button_widget.dart';
import '../../home/model/menu_item_model.dart';
import '../model/transaction_model.dart';
import 'success_transaction_page.dart';

void openSaveTransactionPage({
  required BuildContext context,
  required List<MenuItemModel> listTransaction,
  required VoidCallback onResetTransaction,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (context) => _SaveTransactionPage(
      listTransaction: listTransaction,
      onResetTransaction: onResetTransaction,
    ),
  );
}

class _SaveTransactionPage extends StatefulWidget {
  const _SaveTransactionPage({
    Key? key,
    required this.listTransaction,
    required this.onResetTransaction,
  }) : super(key: key);

  final List<MenuItemModel> listTransaction;
  final VoidCallback onResetTransaction;

  @override
  State<_SaveTransactionPage> createState() => __SaveTransactionPageState();
}

class __SaveTransactionPageState extends State<_SaveTransactionPage> {
  final isSave = false;
  final transactionType = ["Uang Pas", "Rp. 100.000", "Rp. 50.000", "Manual"];
  int? selectedTransactionIndex;

  final listTransaction = <MenuItemModel>[];
  double bayar = 0;

  @override
  void initState() {
    super.initState();
    listTransaction.addAll(widget.listTransaction);
  }

  /// function for handle if user select type transaction
  onTapTransactionType(int index) {
    final selected = transactionType[index];
    setState(() {
      if (selected == "Uang Pas") {
        bayar = listTransaction.getTotal;
      } else if (selected == "Rp. 100.000") {
        bayar = 100000;
      } else if (selected == "Rp. 50.000") {
        bayar = 50000;
      } else {
        bayar = 0;
      }
      selectedTransactionIndex = index;
    });
  }

  /// function for handle if user finish transaction
  void onSave() {
    if (bayar == 0) {
      showFlashBar(
        context: context,
        description: "Hmmm kamu belum isi nominal pembayaran nih...",
      );
      return;
    }

    if (bayar < listTransaction.getTotal) {
      showFlashBar(
        context: context,
        description: "Hmmm nominal pembayaran yang kamu masukan kurang nih...",
      );
      return;
    }

    final transaction = TransactionModel(
      listTransaction: listTransaction,
      bayar: bayar,
    );

    pop(context: context, count: 2);

    openSuccessTransactionPage(
      context: context,
      transaction: transaction,
      onResetTransaction: widget.onResetTransaction,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(MiniG.sizeM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nominal transaksi",
                  style: textTheme.headline1,
                ),
                Text(
                  moneyConverters(listTransaction.getTotal),
                  style: textTheme.headline1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: transactionType.length,
              itemBuilder: (context, index) {
                final title = transactionType[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: MiniGButtonWidget.noGradient(
                    isWitdhAuto: true,
                    color: selectedTransactionIndex == index
                        ? MiniG.greenSecondary
                        : MiniG.unselectedColor,
                    onPressed: () {
                      onTapTransactionType(index);
                    },
                    child: Text(
                      title,
                      style: textTheme.bodyText1?.copyWith(
                        color: selectedTransactionIndex == index
                            ? MiniG.white
                            : MiniG.unselectedColorText,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(MiniG.sizeM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedTransactionIndex == 3) ...{
                  CalculatorWidget(
                    onChanged: (result) {
                      setState(() {
                        bayar = result.nominal;
                      });
                    },
                  ),
                },
                Align(
                  alignment: Alignment.centerRight,
                  child: MiniGButtonWidget(
                    onPressed: onSave,
                    child: const Text("Simpan"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
