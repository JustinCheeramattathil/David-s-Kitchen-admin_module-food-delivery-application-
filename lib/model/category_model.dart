class CategoryModel {
  dynamic id;
  String name;
  ImageCategory image;
  bool isBlocked;

  CategoryModel({
    this.id,
    required this.name,
    required this.image,
    required this.isBlocked,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      image: ImageCategory.fromJson(json['image']),
      isBlocked: json['isBlocked'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image.toMap(),
      'isBlocked': isBlocked,
    };
  }
}

class ImageCategory {
  dynamic publicId;
  String imagepath;

  ImageCategory({
    this.publicId,
    required this.imagepath,
  });

  factory ImageCategory.fromJson(Map<String, dynamic> json) {
    return ImageCategory(
      publicId: json['public_id'],
      imagepath: json['image'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'public_id': publicId,
      'image': imagepath,
    };
  }
}
