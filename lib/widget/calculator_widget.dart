import 'package:flutter/material.dart';
import 'package:mini_g/widget/calculator_result_widget.dart';

import '../constant/icons_assets.dart';
import '../functions/money_converters.dart';
import '../theme/theme_constant.dart';

class _CalculatorResultModel {
  final String resultWithFormatter;
  final double nominal;
  final bool isActive;

  _CalculatorResultModel({
    required this.resultWithFormatter,
    required this.nominal,
    required this.isActive,
  });
}

class CalculatorWidget extends StatefulWidget {
  final bool overideResult;
  final double marginBottom;
  final Function(_CalculatorResultModel result) onChanged;

  const CalculatorWidget({
    Key? key,
    required this.onChanged,
    this.overideResult = false,
    this.marginBottom = 10,
  }) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final listcalculator = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "000",
    "DEL"
  ];

  bool isActive = false;
  String result = "0";

  double get nominal {
    return double.tryParse(result) ?? 0;
  }

  String get resultWithFormatter => moneyConverters(nominal);

  /// function for handle on tap number of calculator
  void onTapNumber(String value) {
    final newResult = result + value;
    final newResulstDouble = double.tryParse(newResult) ?? 0;

    if ((value == "0" || value == "000") && nominal == 0) {
      return;
    }

    if (newResulstDouble > 10000000) {
      return;
    }

    setState(() {
      result = newResult;
      isActive = result != "0" ? true : false;
    });

    handleOnChanged();
  }

  /// function for delete
  void onDelete() {
    if (result == "0") {
      return;
    }

    final newResult = result.substring(0, result.length - 1);
    setState(() {
      if (newResult != "0") {
        result = newResult;
      } else {
        result = "0";
        isActive = false;
      }
    });

    handleOnChanged();
  }

  void onDeleteAll() {
    setState(() {
      result = "0";
      isActive = false;
    });

    handleOnChanged();
  }

  void handleOnChanged() {
    final result = _CalculatorResultModel(
      resultWithFormatter: resultWithFormatter,
      nominal: nominal,
      isActive: isActive,
    );
    widget.onChanged(result);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.overideResult == false) ...{
          CalculatorResultWidet(
            result: resultWithFormatter,
            isActive: isActive,
          ),
        },
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
          ),
          itemCount: listcalculator.length,
          itemBuilder: (context, index) {
            final value = listcalculator[index];
            if (value == "DEL") {
              return InkWell(
                onLongPress: onDeleteAll,
                onTap: onDelete,
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.asset(delete),
                  ),
                ),
              );
            }
            return InkWell(
              onTap: () {
                onTapNumber(value);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: textTheme.headline1,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
