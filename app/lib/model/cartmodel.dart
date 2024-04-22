import 'package:app/model/products.dart';

class Cart {
  final int count;
  final prod pd;
  Cart({required this.count, required this.pd});
  factory Cart.fromJson(Map<String, dynamic> json) {
    late prod item;
    List<prod> l = Products.products;
    for (int i = 0; i < l.length; i++) {
      if (l[i].id == json["prodid"]) {
        item = l[i];
        break;
      }
    }
    return Cart(count: json["quantity"], pd:item);
  }
}

List<Cart> getCart(List cartitems) {
  List<Cart> items = [];
  for (int i = 0; i < cartitems.length; i++) {
    items.add(Cart.fromJson(cartitems[i]));
  }
  return items;
}

class CartItems {
  List<Cart> items = [];
}
