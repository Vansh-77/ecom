import 'package:app/model/products.dart';

class CartItem {
  final int count;
  final prod pd;
  CartItem({required this.count, required this.pd});
  factory CartItem.fromList(List<dynamic> list) {
    late prod item;
    List<prod> l = Products.products;
    for (int i = 0; i < l.length; i++) {
      if (l[i].id == list[1]) {
        item = l[i];
        break;
      }
    }
    return CartItem(count: list[2], pd: item);
  }
}

List<CartItem> getCart(List cartItems) {
  List<CartItem> items = [];
  for (int i = 0; i < cartItems.length; i++) {
    items.add(CartItem.fromList(cartItems[i]));
  }
  return items;
}

class Items {
  static List<CartItem> items = [];
}
