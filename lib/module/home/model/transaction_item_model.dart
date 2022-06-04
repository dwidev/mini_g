class TransactionItemModel {
  final String image;
  final String name;
  final double price;
  final int amount;

  TransactionItemModel({
    required this.image,
    required this.name,
    required this.price,
    this.amount = 0,
  });
}
