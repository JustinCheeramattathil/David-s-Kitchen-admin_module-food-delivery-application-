class ProductModel {
  dynamic id;
  String name;
  String category;
  ProductImage image;
  String description;
  String price;
  bool isBlocked;

  ProductModel({
    this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    required this.isBlocked,
  });
}

class ProductImage {
  String imageUrl;
  String imageId;
  ProductImage({required this.imageUrl, required this.imageId});
}
