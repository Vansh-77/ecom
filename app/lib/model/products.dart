class prod {
  final int id;
  final String name;
  final num price;
  final String image;
  final num rating;
  prod({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });
  factory prod.fromJson(Map<String, dynamic> json) {
    return prod(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        rating: json["rating"]["rate"]);
  }
}

List<prod> getproducts(List jsons) {
  List<prod> products = [];
  for (int i = 0; i < jsons.length; i++) {
    prod product = prod.fromJson(jsons[i]);
    products.add(product);
  }
  return products;
}

class Products {
  static List<prod> products = [];
}
