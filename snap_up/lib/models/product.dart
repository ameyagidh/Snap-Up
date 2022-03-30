class Product {
  int? id;
  int? SellerId;
  String? name;
  String? image;
  // String? unCompressedImage;
  int? PricePerKg;
  String? desciption;
  int? interactionCount;

// map all the elements properly.

  Product.fromMap(Map<dynamic, dynamic> map) {
    id = int.parse(map['id']);
    SellerId = map['seller_id'];
    name = map['name'];
    image = map['uncompressed_image'];
    // unCompressedImage = map['image'];
    PricePerKg = int.parse(map['price_per_kg']);
    desciption = map['description'];
    interactionCount = int.parse(map['interaction_count']);
  }
}
