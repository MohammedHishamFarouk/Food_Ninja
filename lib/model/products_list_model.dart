class ProductsListModel {
  final List<dynamic> productsList;

  ProductsListModel({required this.productsList});

  factory ProductsListModel.fromJson(List<dynamic> jsonData) {
    return ProductsListModel(
      productsList: jsonData,
    );
  }
}
