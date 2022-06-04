import 'package:mini_g/module/home/model/menu_item_model.dart';

class TransactionModel {
  final List<MenuItemModel> listTransaction;
  final double bayar;

  TransactionModel({
    required this.listTransaction,
    required this.bayar,
  });
}
