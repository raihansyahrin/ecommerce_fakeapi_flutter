// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';

class CartsModel {
  final int id;
  final int userId;
  final DateTime date;
  List<ProductsModel> products;

  CartsModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<ProductsModel>.from(
            json["products"].map((x) => ProductsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
