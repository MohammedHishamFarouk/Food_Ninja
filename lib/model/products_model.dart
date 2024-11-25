class ProductsModel {
  final List<String> foodImage;
  final String title;
  final String hintText;
  final String description;
  final double price;
  final int? id;

  ProductsModel({
    required this.description,
    required this.foodImage,
    required this.title,
    required this.hintText,
    required this.price,
    this.id,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      hintText: jsonData["description"],
      foodImage: List<String>.from(jsonData["images"]),
      id: jsonData['id'],
    );
  }
}
