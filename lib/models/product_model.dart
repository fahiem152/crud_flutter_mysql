import 'dart:convert';

ProductModel productFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productToJson(ProductModel data) => json.encode(data.toJson());
List<ProductModel> productModelFromJson(List data) =>
    List<ProductModel>.from(data.map((x) => ProductModel.fromJson(x)));

class ProductModel {
  // final int id;
  final String name;
  final String description;
  final int price;
  final int category_id;
  final int brand_id;
  final String urlImage;

  ProductModel({
    // required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category_id,
    required this.brand_id,
    required this.urlImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      // id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category_id: json['category_id'],
      brand_id: json['brand_id'],
      urlImage: json['urlImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category_id': category_id,
      'brand_id': brand_id,
      'urlImage': urlImage,
    };
  }
}
