import 'item.dart';
import 'package:uuid/uuid.dart';

class ShoppingCart {
  final orderId = Uuid().v4();
  List<Item> items = [];

  bool get isEmpty => items.isEmpty;

  int get numOfItems => items.length;

  int get totalPrice {
    int totalPrice = 0;
    items.forEach((i) {
      totalPrice += i.price * i.number;
    });
    return totalPrice;
  }

  String get formattedTotalPrice {
    if (isEmpty) {
      return Item.formatter.format(0);
    }
    return Item.formatter.format(this.totalPrice);
  }

  bool isExists(item) {
    if (items.isEmpty) {
      return false;
    }
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    return indexOfItem >= 0;
  }

  void add(Item item) {
    // if (items.isEmpty || !this.isExists(item)) {
    items.add(item);
    // if (item.number < 20) item.number += 1;
    // }
    // if (!this.isExists(item)) {
    //   items.add(item);
    // }
    // else if (this.isExists(item)) {
    // items.add(item);
    // if (item.number < 20) item.number += 1;
    // }
  }

  void remove(Item item) {
    // if (items.isEmpty) return;
    // final indexOfItem = items.indexWhere((i) => item.id == i.id);
    // print("index: " + indexOfItem.toString());
    // if (indexOfItem >= 0) {
    // items.removeAt(indexOfItem);
    items.removeWhere((i) => i.id == item.id);
    // if (item.number > 0) item.number -= 1;
    // }
  }

  Map<String, dynamic> get toMap {
    final List<Map<String, dynamic>> items = this
        .items
        .map((i) => {
              'id': i.id,
              'name': i.name,
              'description': i.description,
              'price': i.price,
              'inStock': i.inStock,
              'imageUrl': i.imageUrl,
              'number': i.number
            })
        .toList();
    return {"orderId": this.orderId, "items": items, "total": this.totalPrice};
  }
}
