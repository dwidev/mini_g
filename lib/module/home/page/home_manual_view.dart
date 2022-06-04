import 'package:flutter/material.dart';

import '../../../functions/random_number.dart';
import '../../../theme/theme_constant.dart';
import '../../../widget/calculator_result_widget.dart';
import '../../../widget/calculator_widget.dart';
import '../../../widget/circle_button_widget.dart';
import '../model/menu_item_model.dart';

abstract class HomeManualViewDelegate {
  void onAddItem(MenuItemModel item);
}

class HomeManualView extends StatefulWidget {
  final HomeManualViewDelegate delegate;
  const HomeManualView({Key? key, required this.delegate}) : super(key: key);

  @override
  State<HomeManualView> createState() => _HomeManualViewState();
}

class _HomeManualViewState extends State<HomeManualView> {
  String resultWithFormatter = "Rp .";
  double nominal = 0;
  bool isActive = false;
  String? name;

  void onAddItem() {
    final item = MenuItemModel(
      id: "manual-${generateRandomNumber()}",
      image: "no-image",
      name: name ?? "Pesanan manual",
      price: nominal,
      amount: 1,
    );
    widget.delegate.onAddItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukan judul (optional)",
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: MiniG.sizeM,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: MiniG.sizeM),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CalculatorResultWidet(
                          result: resultWithFormatter,
                          isActive: isActive,
                        ),
                      ),
                      CircleButtonWidget(
                        padding: const EdgeInsets.all(10),
                        icon: Icons.add,
                        onPressed: isActive ? onAddItem : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: CalculatorWidget(
                overideResult: true,
                marginBottom: 80,
                onChanged: (result) {
                  setState(() {
                    resultWithFormatter = result.resultWithFormatter;
                    nominal = result.nominal;
                    isActive = result.isActive;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
