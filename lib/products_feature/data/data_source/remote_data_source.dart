import 'dart:convert';

import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';

import 'package:ecommerce_motion_flutter/products_feature/data/models/sub_model.dart';
import 'package:http/http.dart' as http;

class AllProductsDataSource {
  Future<List<ProductsModel>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final products = json.map((e) {
        return ProductsModel(
            id: e['id'],
            title: e['title'],
            price: e['price'].toDouble(),
            description: e['description'],
            category: e['category'],
            image: e['image'],
            rating: RatingModel(
              rate: e['rating']['rate'].toDouble(),
              count: e['rating']['count'],
            ));
      }).toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductsModel> getProductDetails(int productId) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/$productId'));
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
