import 'package:mobile/app/data/product_model.dart';

class CategoryModel {
  final String? sId;
  final String? name;
  final String? description;
  final String? by;
  final String? icon;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  // Liste classique
  final List<ProductModel> products;
  bool checked;

  CategoryModel({
    this.sId,
    this.name,
    this.description,
    this.by,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.products = const [],
    this.checked = false,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final productList = (json['products'] as List<dynamic>? ?? [])
        .map((p) => ProductModel.fromJson(p as Map<String, dynamic>))
        .toList();

    return CategoryModel(
      sId: json['_id'],
      name: json['name'],
      description: json['description'],
      by: json['by'],
      icon: json['icon'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      products: productList,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'name': name,
        'description': description,
        'by': by,
        'icon': icon,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': iV,
        'products': products.map((p) => p.toJson()).toList(),
      };
}
