class MenuItemModel {
  final String id;
  final String name;
  final double price;
  final String? image;
  final int amount;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.image,
    this.amount = 0,
  });

  MenuItemModel copyWith({
    String? id,
    String? name,
    double? price,
    String? image,
    int? amount,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      amount: amount ?? this.amount,
    );
  }
}

extension MenuItemModelExt on List<MenuItemModel> {
  int get getTotalItems {
    int totalItem = 0;
    for (var item in this) {
      totalItem += item.amount;
    }
    return totalItem;
  }

  double get getTotalPrice {
    double totalPrice = 0;
    for (var item in this) {
      totalPrice += item.amount * item.price;
    }
    return totalPrice;
  }

  double get getPpn {
    return (getTotalPrice * 10) / 100;
  }

  double get getTotal {
    return getTotalPrice + getPpn;
  }
}
