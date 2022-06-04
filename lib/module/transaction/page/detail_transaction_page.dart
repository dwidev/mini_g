import 'package:flutter/material.dart';
import 'package:mini_g/functions/money_converters.dart';
import 'package:mini_g/widget/row_text_widget.dart';

import '../../../navigator/navigator.dart';
import '../../../theme/theme_constant.dart';
import '../../../widget/minig_button_widget.dart';
import '../../home/model/menu_item_model.dart';
import '../widget/box_container_transaction.dart';
import '../widget/transaction_order_item_widget.dart';
import 'save_transaction_page.dart';

class DetailTransactionPage extends StatefulWidget {
  const DetailTransactionPage({
    Key? key,
    required this.listTransaction,
    required this.onResetTransaction,
  }) : super(key: key);

  final List<MenuItemModel> listTransaction;
  final VoidCallback onResetTransaction;

  @override
  State<DetailTransactionPage> createState() => _DetailTransactionPageState();
}

class _DetailTransactionPageState extends State<DetailTransactionPage> {
  String get total => moneyConverters(
        widget.listTransaction.getTotal,
      );

  String get jumlahPesanan => widget.listTransaction.getTotalItems.toString();

  String get subTotal => moneyConverters(
        widget.listTransaction.getTotalPrice,
      );

  String get ppn => moneyConverters(
        widget.listTransaction.getPpn,
      );

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return Scaffold(
      backgroundColor: MiniG.unselectedColor,
      appBar: AppBar(
        elevation: 2,
        title: Text("Rincian pesanan", style: textTheme.headline1),
        leading: IconButton(
          onPressed: () {
            pop(context: context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ContinerBoxTransaction(
                    title: "Daftar pesannan",
                    description:
                        "periksa & atur kembali untuk menyesuaikan pesanan",
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.listTransaction.length,
                      itemBuilder: ((context, index) {
                        final menu = widget.listTransaction[index];
                        return TransactionOrderItemWidget(
                          menu: menu,
                        );
                      }),
                    ),
                  ),
                  ContinerBoxTransaction(
                    title: "Transaksi",
                    description: "estimasi harga yang harus dibayarkan",
                    child: Column(
                      children: [
                        RowTextWidget(
                          firstText: const Text("Jumlah Pesanan"),
                          secondText: Text(
                            jumlahPesanan,
                            style: textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RowTextWidget(
                          firstText: const Text("Sub total"),
                          secondText: Text(
                            subTotal,
                            style: textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RowTextWidget(
                          firstText: const Text("PPN (10%)"),
                          secondText: Text(
                            ppn,
                            style: textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          color: MiniG.unselectedColor,
                          thickness: 1,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: MiniG.sizeMS),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total dibayar"),
                              Text(
                                total,
                                style: textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: MiniG.sizeXXL,
                vertical: MiniG.sizeM,
              ),
              width: size.width,
              color: Colors.white,
              child: Column(
                children: [
                  MiniGButtonWidget(
                    isWitdhAuto: true,
                    onPressed: () {
                      openSaveTransactionPage(
                        context: context,
                        listTransaction: widget.listTransaction,
                        onResetTransaction: widget.onResetTransaction,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Bayar"),
                        Text(
                          total,
                          style: textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: MiniG.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: MiniG.sizeS),
                  TextButton(
                    onPressed: () {
                      widget.onResetTransaction();
                      pop(context: context);
                    },
                    child: Text(
                      "Batalkan transaksi",
                      style: textTheme.bodyText1?.copyWith(
                        color: MiniG.redPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
